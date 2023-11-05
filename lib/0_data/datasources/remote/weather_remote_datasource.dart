import 'package:dio/dio.dart';
import 'package:rnd_clean_architecture/0_data/data.dart';

import '../interface/weather_remote_source_interface.dart';

class WeatherRemoteDatasourceImpl implements WeatherRemoteSourceInterface {
  @override
  Future<List<WeatherModel>> getWeatherListFromApi({
    int? page,
    int? perpage,
  }) async {
    final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=199e7f64f4ab8967f6982b40a157f62d&units=metric');

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      return ((response.data['list'] ?? []) as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList();
    }
  }
}
