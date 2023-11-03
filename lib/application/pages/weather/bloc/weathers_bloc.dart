import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/domain.dart';

part 'weathers_event.dart';
part 'weathers_state.dart';

class WeathersBloc extends Bloc<WeathersEvent, WeathersState> {
  WeathersBloc() : super(WeathersState()) {
    on<WeathersRequest>((event, emit) async {
      emit(state.copyWith(status: WeathersBlocStatus.loading));

      final result = usecases.getWeatherList();
      await await Future.delayed(const Duration(seconds: 10), () {});
      emit(state.copyWith(status: WeathersBlocStatus.success));
    });
  }

  WeatherUsecases usecases = WeatherUsecases();
}
