// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserEntity extends Equatable {
  final User? user;
  final String? message;

  const UserEntity({
    this.user,
    this.message,
  });

  @override
  List<Object?> get props => [user, message];
}
