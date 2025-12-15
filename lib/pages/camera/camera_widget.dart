import 'package:esharty/component/menu/menu_widget.dart';
import 'package:flutter/widgets.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'camera_model.dart';
export 'camera_model.dart';
import 'package:camera/camera.dart';
import 'package:tflite_v2/tflite_v2.dart';

late List<CameraDescription> cameras;

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraModel _model;

  // >>>
  bool isWorking = false;
  late CameraImage imgcamera;
  late CameraController cameraController;
  String result = '';
  int flipCamera = 0;
  // >>>

  //  Load Model
  Future<void> loadmodel() async {
    try {
      await Tflite.loadModel(
        model: 'images/model.tflite',
        labels: 'images/model.txt',
        useGpuDelegate: false,
        isAsset: true,
      );
      setState(() {}); // trigger UI rebuild after successful loading
    } catch (error) {
      print("Error loading model: $error");
    }
  }
//  Load Model

// Run Model
  runModel() async {
    if (imgcamera != null) {
      var recognitions = await Tflite.runModelOnFrame(
          bytesList: imgcamera.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: imgcamera.height,
          imageWidth: imgcamera.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.6,
          asynch: true);

      result = '';
      recognitions?.forEach((response) {
        result += response["label"] +
            "  " +
            (response["confidence"] as double).toStringAsFixed(2) +
            '\n\n';
        setState(() {
          result = result;
        });
      });
    } else {
      print("Camera image not available yet");
    }
  }
// Run Model

// camera
  initCam() {
    cameraController =
        CameraController(cameras[flipCamera], ResolutionPreset.medium);
    cameraController.initialize().then((imageCamera) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((image) {
          try {
            imgcamera = image;
            runModel();
          } catch (error) {
            print("Error in camera stream: $error");
          }
        });
      });
    });
  }
// camera

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraModel());
    initCam();
    loadmodel();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
    // initCam();
    Tflite.close();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('HomePage');
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFF95655A),
                          size: 24.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Frame_37.png',
                            width: 57.0,
                            height: 70.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(
                                            1.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: const SizedBox(
                                        width: 187.0,
                                        child: MenuWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            child: const Icon(
                              Icons.format_list_bulleted,
                              color: Color(0xFF95655A),
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(children: [
                  if (cameraController.value.isInitialized)
                    Align(
                        alignment: Alignment.center,
                        child: CameraPreview(cameraController)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              flipCamera == 1 ? flipCamera = 0 : flipCamera = 1;
                              initCam();
                            });
                          },
                          child: Icon(Icons.flip_camera_android,size: 32,color: Colors.white70,),
                        ),
                      ),
                    ),
                  )
                ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          color: Color.fromARGB(255, 217, 217, 217),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "$result",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
