import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnd_clean_architecture/1_domain/domain.dart';

part 'weathers_state.dart';

class WeathersCubit extends Cubit<WeathersState> {
  WeathersCubit({
    required this.usecases,
  }) : super(const WeathersLoadingState());

  final WeatherUsecases usecases;

  Future<void> fetchWeathers({required int page, required int perpage}) async {
    emit(const WeathersLoadingState());

    try {
      final result = await usecases.getWeatherList(page, perpage);

      if (result.isLeft) {
        emit(const WeathersErrorState());
      } else {
        emit(WeathersLoadedState(weatherList: result.right));
      }
    } catch (e) {
      emit(const WeathersErrorState());
    }
  }
}
