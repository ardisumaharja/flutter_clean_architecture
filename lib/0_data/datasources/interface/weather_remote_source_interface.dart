import '../../models/weather_model.dart';

abstract class WeatherRemoteSourceInterface {
  Future<List<WeatherModel>> getWeatherListFromApi({
    int page,
    int perpage,
  });
}
