part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUpRequested extends AuthEvent {
  final String username, email, password;

  AuthSignUpRequested({
    required this.username,
    required this.email,
    required this.password,
  });
}
