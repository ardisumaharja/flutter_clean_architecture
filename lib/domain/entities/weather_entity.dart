// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final int id;
  const WeatherEntity({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
