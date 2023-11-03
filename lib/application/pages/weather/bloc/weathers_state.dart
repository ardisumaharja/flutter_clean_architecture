// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weathers_bloc.dart';

class WeathersState extends Equatable {
  final WeathersBlocStatus status;
  final WeathersParams params;
  final List<WeatherEntity> weathersResult;

  WeathersState({
    this.status = WeathersBlocStatus.loading,
    this.params = const WeathersParams(),
    this.weathersResult = const [],
  });

  @override
  List<Object?> get props => [status, params, weathersResult];

  WeathersState copyWith({
    WeathersBlocStatus? status,
    WeathersParams? params,
    List<WeatherEntity>? weathersResult,
  }) {
    return WeathersState(
      status: status ?? this.status,
      params: params ?? this.params,
      weathersResult: weathersResult ?? this.weathersResult,
    );
  }
}

enum WeathersBlocStatus { loading, success, failure }

class WeathersParams extends Equatable {
  final int perPage;
  final int page;
  const WeathersParams({
    this.perPage = 10,
    this.page = 1,
  });

  WeathersParams copyWith({
    int? perPage,
    int? page,
  }) {
    return WeathersParams(
      perPage: perPage ?? this.perPage,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [perPage, page];
}
