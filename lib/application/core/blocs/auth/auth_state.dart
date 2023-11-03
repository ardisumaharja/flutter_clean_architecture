part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserUnknown extends AuthState {}

class UserAuthenticated extends AuthState {}

class UserUnauthenticated extends AuthState {}
