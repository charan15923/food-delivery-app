import 'package:equatable/equatable.dart';

import '../../../../core/assets/assets.gen.dart';

class DishEntity extends Equatable {
  const DishEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.calories,
    required this.grams,
    required this.proteins,
    required this.fats,
    required this.carbs,
    required this.gradientIndex,
  });
  final String id;
  final String name;
  final AssetGenImage image;
  final double price;
  final String description;
  final String calories;
  final String grams;
  final String proteins;
  final String fats;
  final String carbs;
  final int gradientIndex;

  @override
  List<Object?> get props => [
        id,
      ];
}
