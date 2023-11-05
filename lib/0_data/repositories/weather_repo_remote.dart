// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';
import 'package:rnd_clean_architecture/0_data/data.dart';
import 'package:rnd_clean_architecture/0_data/datasources/interface/weather_remote_source_interface.dart';
import 'package:rnd_clean_architecture/0_data/datasources/mapper/weather_mapper.dart';
import 'package:rnd_clean_architecture/1_domain/domain.dart';

class WeatherRepoRemote with WeatherMapper implements WeatherRepo {
  final WeatherRemoteSourceInterface remoteSource;
  WeatherRepoRemote({
    required this.remoteSource,
  });

  @override
  Future<Either<Failure, List<WeatherEntity>>> getWeatherListFromDataSource(
    int page,
    int perpage,
  ) async {
    try {
      final result = await remoteSource.getWeatherListFromApi(
        page: page,
        perpage: perpage,
      );

      final List<WeatherEntity> list =
          result.map((item) => weatherModelToEntity(item)).toList();

      return Right(list);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}
