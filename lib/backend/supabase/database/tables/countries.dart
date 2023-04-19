import '../database.dart';

class CountriesTable extends SupabaseTable<CountriesRow> {
  @override
  String get tableName => 'countries';

  @override
  CountriesRow createRow(Map<String, dynamic> data) => CountriesRow(data);
}

class CountriesRow extends SupabaseDataRow {
  CountriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CountriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String get iso2 => getField<String>('iso2')!;
  set iso2(String value) => setField<String>('iso2', value);

  String? get iso3 => getField<String>('iso3');
  set iso3(String? value) => setField<String>('iso3', value);

  String? get localName => getField<String>('local_name');
  set localName(String? value) => setField<String>('local_name', value);

  String? get continent => getField<String>('continent');
  set continent(String? value) => setField<String>('continent', value);
}
