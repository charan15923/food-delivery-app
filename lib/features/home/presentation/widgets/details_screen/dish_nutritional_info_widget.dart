import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';
import 'dish_value_item_widget.dart';

class DishNutritionalInfoWidget extends StatelessWidget {
  const DishNutritionalInfoWidget({
    required this.dish,
    super.key,
  });

  final DishEntity dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIDimensions.symmetricPaddingInsets(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: UIDimensions.shapeDecoration(
        borderColor: AppColors.grey_300,
        cornerRadius: 10,
      ),
      child: Row(
        children: [
          DishValueItemWidget(title: 'kcal', value: dish.calories),
          UIDimensions.horizontalSpace(10),
          DishValueItemWidget(title: 'grams', value: dish.grams),
          UIDimensions.horizontalSpace(10),
          DishValueItemWidget(title: 'protein', value: dish.proteins),
          UIDimensions.horizontalSpace(10),
          DishValueItemWidget(title: 'fat', value: dish.fats),
          UIDimensions.horizontalSpace(10),
          DishValueItemWidget(title: 'carbs', value: dish.carbs),
        ],
      ),
    );
  }
}
