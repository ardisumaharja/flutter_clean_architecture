part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthCubitInitial extends AuthState {
  final bool isLoggedIn;
  final String? userId;

  AuthCubitInitial({
    required this.isLoggedIn,
    this.userId,
  });
}
