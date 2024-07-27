import 'package:flutter/material.dart';
import 'package:flutter_app/core/app_secrets/app_secrets.dart';
import 'package:flutter_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:flutter_app/features/auth/data/datasource/auth_datasource_impl.dart';
import 'package:flutter_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  var supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  // Registering auth dependencies
  GetIt.I.registerSingleton<SupabaseClient>(
    supabase.client,
  );
  GetIt.I.registerSingleton<AuthDatasource>(
    AuthDatasourceImpl(supabaseClient: GetIt.I<SupabaseClient>()),
  );
  GetIt.I.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(authDatasource: GetIt.I<AuthDatasource>()),
  );
  GetIt.I.registerSingleton<UserSignUp>(
    UserSignUp(authRepository: GetIt.I<AuthRepository>()),
  );
  GetIt.I.registerSingleton<AuthBloc>(
    AuthBloc(userSignUp: GetIt.I<UserSignUp>()),
  );
}
