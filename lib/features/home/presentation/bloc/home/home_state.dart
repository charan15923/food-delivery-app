part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    required this.dishes,
    required this.sliderItems,
  });
  final List<DishEntity> dishes;
  final List<DishEntity> sliderItems;

  @override
  List<Object> get props => [dishes, sliderItems];
}

final class HomeErrorState extends HomeState {
  const HomeErrorState({
    required this.errorMessage,
  });
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
