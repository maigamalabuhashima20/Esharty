import '../database.dart';

class ProfileNewTable extends SupabaseTable<ProfileNewRow> {
  @override
  String get tableName => 'profile_new';

  @override
  ProfileNewRow createRow(Map<String, dynamic> data) => ProfileNewRow(data);
}

class ProfileNewRow extends SupabaseDataRow {
  ProfileNewRow(super.data);

  @override
  SupabaseTable get table => ProfileNewTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);
}
