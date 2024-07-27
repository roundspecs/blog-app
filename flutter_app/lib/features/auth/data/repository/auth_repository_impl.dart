import 'package:flutter_app/core/errors/failure.dart';
import 'package:flutter_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl({required AuthDatasource authDatasource})
      : _authDatasource = authDatasource;

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
    String username,
    String email,
    String password,
  ) async {
    try {
      var userId = await _authDatasource.signUpWithEmailAndPassword(
          username, email, password);
      return right(userId);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
