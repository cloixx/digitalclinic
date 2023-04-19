import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://oglmkpwpiottypmzxnzu.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9nbG1rcHdwaW90dHlwbXp4bnp1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzI4MjM5MzUsImV4cCI6MTk4ODM5OTkzNX0.Sj1Av__w757FSS6x-D5iyMkI-vX-NfVCShZDkjrO6E4';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
      );
}
