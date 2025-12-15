import '../database.dart';

class EditProfileTable extends SupabaseTable<EditProfileRow> {
  @override
  String get tableName => 'edit_Profile';

  @override
  EditProfileRow createRow(Map<String, dynamic> data) => EditProfileRow(data);
}

class EditProfileRow extends SupabaseDataRow {
  EditProfileRow(super.data);

  @override
  SupabaseTable get table => EditProfileTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  String? get name => getField<String>('Name');
  set name(String? value) => setField<String>('Name', value);

  String? get email => getField<String>('Email');
  set email(String? value) => setField<String>('Email', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
