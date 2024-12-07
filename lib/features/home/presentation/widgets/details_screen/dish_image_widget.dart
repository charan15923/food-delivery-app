import 'package:flutter/material.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';

class DishImageWidget extends StatelessWidget {
  const DishImageWidget({
    required this.dish,
    super.key,
  });

  final DishEntity dish;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(UIDimensions.radius(240)),
      child: dish.image.image(
        width: UIDimensions.width(200),
        height: UIDimensions.width(200),
        fit: BoxFit.fill,
      ),
    );
  }
}
