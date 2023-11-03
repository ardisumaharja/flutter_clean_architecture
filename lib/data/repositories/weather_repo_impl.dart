import 'package:dartz/dartz.dart';
import 'package:rnd_clean_architecture/data/data.dart';
import 'package:rnd_clean_architecture/domain/domain.dart';

class WeatherRepoImpl implements WeatherRepo {
  final WeatherRemoteDatasource datasource = WeatherRemoteDatasourceImpl();

  @override
  Future<Either<Failure, List<WeatherEntity>>>
      getWeatherListFromDataSource() async {
    try {
      final result = await datasource.getWeatherListFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, WeatherEntity>>
      getWeatherDetailFromDataSource() async {
    try {
      final result = await datasource.getWeatherDetailFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
