import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Name = prefs.getString('ff_Name') ?? _Name;
    });
    _safeInit(() {
      _Email = prefs.getString('ff_Email') ?? _Email;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _NotMatch = false;
  bool get NotMatch => _NotMatch;
  set NotMatch(bool value) {
    _NotMatch = value;
  }

  bool _isNewUploadePhoto = false;
  bool get isNewUploadePhoto => _isNewUploadePhoto;
  set isNewUploadePhoto(bool value) {
    _isNewUploadePhoto = value;
  }

  String _Name = '';
  String get Name => _Name;
  set Name(String value) {
    _Name = value;
    prefs.setString('ff_Name', value);
  }

  String _Email = '';
  String get Email => _Email;
  set Email(String value) {
    _Email = value;
    prefs.setString('ff_Email', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
