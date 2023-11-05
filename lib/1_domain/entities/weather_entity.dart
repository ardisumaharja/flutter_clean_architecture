// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final int id;
  final String date;
  final double temperature;
  final String type;
  final String icon;
  final double maxTemp;
  final double minTemp;
  final String desc;

  const WeatherEntity({
    required this.id,
    required this.date,
    required this.temperature,
    required this.type,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.desc,
  });

  @override
  List<Object?> get props => [
        id,
        date,
        temperature,
        type,
        icon,
        maxTemp,
        minTemp,
        desc,
      ];
}
