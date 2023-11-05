// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final int id;
  final String date;
  final double temperature;
  final String type;
  final String icon;
  final double maxTemp;
  final double minTemp;
  final String desc;

  const WeatherModel({
    required this.id,
    required this.date,
    required this.temperature,
    required this.type,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.desc,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        id: json['weather'][0]['id'].toInt(),
        date: json['dt_txt'].toString(),
        temperature: json['main']['temp'].toDouble(),
        type: json['weather'][0]['main'].toString(),
        icon: json['weather'][0]['icon'].toString(),
        maxTemp: json['main']['temp_min'].toDouble(),
        minTemp: json['main']['temp_max'].toDouble(),
        desc: json['weather'][0]['description'].toString());
  }

  @override
  List<Object?> get props => [
        id,
        date,
        temperature,
        type,
        maxTemp,
        minTemp,
        desc,
      ];
}
