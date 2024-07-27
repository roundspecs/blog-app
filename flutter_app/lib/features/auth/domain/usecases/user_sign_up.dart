import 'package:flutter_app/core/errors/failure.dart';
import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<String, UserSignUpParam> {
  final AuthRepository _authRepository;

  UserSignUp({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, String>> call(params) {
    return _authRepository.signUpWithEmailAndPassword(
      params.username,
      params.email,
      params.password,
    );
  }
}

class UserSignUpParam {
  final String username;
  final String email;
  final String password;

  UserSignUpParam({
    required this.username,
    required this.email,
    required this.password,
  });
}
