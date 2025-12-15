import '../database.dart';

class LettersTable extends SupabaseTable<LettersRow> {
  @override
  String get tableName => 'Letters';

  @override
  LettersRow createRow(Map<String, dynamic> data) => LettersRow(data);
}

class LettersRow extends SupabaseDataRow {
  LettersRow(super.data);

  @override
  SupabaseTable get table => LettersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get videoUrl => getField<String>('video_url');
  set videoUrl(String? value) => setField<String>('video_url', value);

  String? get videoTitle => getField<String>('video_title');
  set videoTitle(String? value) => setField<String>('video_title', value);

  String? get letter => getField<String>('letter');
  set letter(String? value) => setField<String>('letter', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get profileId => getField<int>('profile_id');
  set profileId(int? value) => setField<int>('profile_id', value);
}
