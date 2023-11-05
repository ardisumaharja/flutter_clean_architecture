import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthCubitInitial(isLoggedIn: false));

  void authStateChanged({User? user}) {
    final bool isLoggedIn = user != null;

    emit(AuthCubitInitial(
      userId: user?.uid,
      isLoggedIn: isLoggedIn,
    ));
  }
}
