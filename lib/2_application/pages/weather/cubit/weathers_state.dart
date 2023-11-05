part of 'weathers_cubit.dart';

abstract class WeathersState extends Equatable {
  const WeathersState();
  @override
  List<Object?> get props => [];
}

class WeathersLoadingState extends WeathersState {
  const WeathersLoadingState();
}

class WeathersErrorState extends WeathersState {
  const WeathersErrorState();
}

class WeathersLoadedState extends WeathersState {
  final List<WeatherEntity> weatherList;
  const WeathersLoadedState({required this.weatherList});
  @override
  List<Object?> get props => [weatherList];
}
