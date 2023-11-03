import 'package:dartz/dartz.dart';
import 'package:rnd_clean_architecture/domain/entities/weather_entity.dart';
import 'package:rnd_clean_architecture/domain/failures/failures.dart';

abstract class WeatherRepo {
  Future<Either<Failure, List<WeatherEntity>>> getWeatherListFromDataSource();
  Future<Either<Failure, WeatherEntity>> getWeatherDetailFromDataSource();
}
