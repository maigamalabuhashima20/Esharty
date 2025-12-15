import '../database.dart';

class VideosCharTable extends SupabaseTable<VideosCharRow> {
  @override
  String get tableName => 'videos_Char';

  @override
  VideosCharRow createRow(Map<String, dynamic> data) => VideosCharRow(data);
}

class VideosCharRow extends SupabaseDataRow {
  VideosCharRow(super.data);

  @override
  SupabaseTable get table => VideosCharTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get videoUrl => getField<String>('video_url');
  set videoUrl(String? value) => setField<String>('video_url', value);

  String? get videoTitle => getField<String>('video_title');
  set videoTitle(String? value) => setField<String>('video_title', value);

  String? get letters => getField<String>('Letters');
  set letters(String? value) => setField<String>('Letters', value);
}
