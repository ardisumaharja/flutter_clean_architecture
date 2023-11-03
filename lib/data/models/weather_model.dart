import 'package:equatable/equatable.dart';
import 'package:rnd_clean_architecture/domain/domain.dart';

class WeatherModel extends WeatherEntity with EquatableMixin {
  WeatherModel({required int id}) : super(id: id);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(id: json['id']);
  }
}
