import 'package:rnd_clean_architecture/0_data/data.dart';
import 'package:rnd_clean_architecture/1_domain/domain.dart';

mixin WeatherMapper {
  WeatherEntity weatherModelToEntity(WeatherModel model) {
    final entity = WeatherEntity(
      id: model.id,
      date: model.date,
      temperature: model.temperature,
      type: model.type,
      icon: model.icon,
      maxTemp: model.maxTemp,
      minTemp: model.minTemp,
      desc: model.desc,
    );

    return entity;
  }
}
