import 'package:flutter/material.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';
import 'dish_item_widget.dart'; // Assume this is already created

class CartItemsListWidget extends StatelessWidget {
  const CartItemsListWidget({
    required this.items,
    required this.onIncreaseTapped,
    required this.onDecreaseTapped,
    super.key,
  });

  final Map<DishEntity, int> items;
  final ValueChanged<DishEntity> onIncreaseTapped;
  final ValueChanged<DishEntity> onDecreaseTapped;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final dish = items.keys.elementAt(index);
        final quantity = items.values.elementAt(index);
        return DishItemWidget(
          dish: dish,
          quantity: quantity,
          onIncreaseTapped: () => onIncreaseTapped(dish),
          onDecreaseTapped: () => onDecreaseTapped(dish),
        );
      },
      separatorBuilder: (context, index) {
        return UIDimensions.verticalSpace(10);
      },
    );
  }
}
