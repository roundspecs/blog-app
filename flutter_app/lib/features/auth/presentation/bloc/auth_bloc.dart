import 'package:flutter/foundation.dart';
import 'package:flutter_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({required userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {

    on<AuthSignUpRequested>(_onAuthSignUpRequested);
  }

  Future<void> _onAuthSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    var res = await _userSignUp(UserSignUpParam(
      username: event.username,
      email: event.email,
      password: event.password,
    ));

    res.fold(
      (l) => emit(AuthFailure(message: l.message)), 
      (r) => emit(AuthSuccess(userId: r))
    );
  }
}
