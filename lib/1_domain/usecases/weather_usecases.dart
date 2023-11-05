// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:either_dart/either.dart';
import 'package:rnd_clean_architecture/1_domain/domain.dart';

class WeatherUsecases {
  WeatherUsecases({
    required this.repo,
  });

  final WeatherRepo repo;

  Future<Either<Failure, List<WeatherEntity>>> getWeatherList(
      int page, int perpage) async {
    try {
      final result = repo.getWeatherListFromDataSource(page, perpage);
      return result.fold((left) => Left(left), (right) => Right(right));
    } catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
