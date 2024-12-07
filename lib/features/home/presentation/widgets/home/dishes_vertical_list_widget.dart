import 'package:flutter/material.dart';

import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';
import 'dish_vertical_item_widget.dart';

class DishesVerticalListWidget extends StatelessWidget {
  const DishesVerticalListWidget({required this.dishes, super.key});
  final List<DishEntity> dishes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        // return DishItemWidget(
        //   dish: dishes[index],
        //   quantity: index,
        // );
        return DishVerticalItemWidget(
          dish: dishes[index],
        );
      },
      separatorBuilder: (context, index) => UIDimensions.verticalSpace(20),
    );
  }
}
