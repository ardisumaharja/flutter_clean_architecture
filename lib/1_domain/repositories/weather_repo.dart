import 'package:either_dart/either.dart';
import 'package:rnd_clean_architecture/1_domain/entities/weather_entity.dart';
import 'package:rnd_clean_architecture/1_domain/failures/failures.dart';

abstract class WeatherRepo {
  Future<Either<Failure, List<WeatherEntity>>> getWeatherListFromDataSource(
    int page,
    int perpage,
  );
}
