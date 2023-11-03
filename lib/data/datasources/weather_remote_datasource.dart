import 'package:dio/dio.dart';
import 'package:rnd_clean_architecture/data/data.dart';

abstract class WeatherRemoteDatasource {
  Future<List<WeatherModel>> getWeatherListFromApi();
  Future<WeatherModel> getWeatherDetailFromApi();
}

class WeatherRemoteDatasourceImpl extends WeatherRemoteDatasource {
  final client = Dio();

  @override
  Future<List<WeatherModel>> getWeatherListFromApi() async {
    final response = await client.get('');

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      return ((response.data['data'] ?? []) as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList();
    }
  }

  @override
  Future<WeatherModel> getWeatherDetailFromApi() {
    // TODO: implement getWeatherDetailFromApi
    throw UnimplementedError();
  }
}
