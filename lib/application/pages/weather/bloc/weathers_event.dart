// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weathers_bloc.dart';

abstract class WeathersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeathersRequest extends WeathersEvent {
  final int page;
  final int perPage;

  WeathersRequest({
    required this.page,
    required this.perPage,
  });
}
