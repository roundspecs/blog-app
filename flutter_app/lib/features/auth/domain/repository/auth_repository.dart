import 'package:flutter_app/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signInWithEmailAndPassword(String email, String password);
  Future<Either<Failure, String>> signUpWithEmailAndPassword(String username, String email, String password);
}