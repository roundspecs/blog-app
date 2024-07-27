import 'package:flutter_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final SupabaseClient _supabaseClient;

  AuthDatasourceImpl({required SupabaseClient supabaseClient}) : _supabaseClient = supabaseClient;

  @override
  Future<String> signInWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailAndPassword(String username, String email, String password) async {
    try {
      var response = await _supabaseClient.auth.signUp(email: email, password: password, data: {'username': username});
      if (response.user == null) {
        throw Exception('User not created');
      }
      return response.user!.id;
    } catch (e) {
      throw Exception(e);
    }
  }
}