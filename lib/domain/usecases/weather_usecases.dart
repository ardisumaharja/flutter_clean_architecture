import 'package:dartz/dartz.dart';
import 'package:rnd_clean_architecture/data/data.dart';
import 'package:rnd_clean_architecture/domain/domain.dart';

class WeatherUsecases {
  final repo = WeatherRepoImpl();

  Future<Either<Failure, List<WeatherEntity>>> getWeatherList() async {
    await Future.delayed(const Duration(seconds: 3), () => {});
    return repo.getWeatherListFromDataSource();
  }

  Future<Either<Failure, WeatherEntity>> getWeatherDetail() async {
    await Future.delayed(const Duration(seconds: 3), () => {});
    return repo.getWeatherDetailFromDataSource();
  }
}
