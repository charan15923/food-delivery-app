import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/dish_entity.dart';
import '../../../domain/usecases/get_home_screen_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.getHomeScreenDataUseCase,
  ) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetHomeScreenDataEvent>(_getHomeScreenData);
  }

  final GetHomeScreenDataUseCase getHomeScreenDataUseCase;

  Future<void> _getHomeScreenData(
    GetHomeScreenDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoadingState());
    final result = await getHomeScreenDataUseCase.call(NoParams());
    result.fold(
      (failure) => emit(HomeErrorState(errorMessage: failure.errorMessage)),
      (homeData) {
        emit(
          HomeLoadedState(
            dishes: homeData.popularItems,
            sliderItems: homeData.sliderItems,
          ),
        );
      },
    );
  }
}
