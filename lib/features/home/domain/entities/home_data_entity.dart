import 'package:equatable/equatable.dart';

import 'dish_entity.dart';

class HomeDataEntity extends Equatable {
  const HomeDataEntity({
    required this.sliderItems,
    required this.popularItems,
  });
  final List<DishEntity> sliderItems;
  final List<DishEntity> popularItems;

  @override
  List<Object?> get props => [sliderItems, popularItems];
}
