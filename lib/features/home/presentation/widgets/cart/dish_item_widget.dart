import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';

class DishItemWidget extends StatelessWidget {
  const DishItemWidget({
    required this.dish,
    required this.quantity,
    required this.onIncreaseTapped,
    required this.onDecreaseTapped,
    super.key,
  });

  final DishEntity dish;
  final int quantity;
  final VoidCallback onIncreaseTapped;
  final VoidCallback onDecreaseTapped;

  @override
  Widget build(BuildContext context) {
    return UIDimensions.padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading image
          ClipRRect(
            borderRadius: BorderRadius.circular(UIDimensions.radius(120)),
            child: dish.image.image(
              width: UIDimensions.width(60),
              height: UIDimensions.width(60),
              fit: BoxFit.cover,
            ),
          ),
          UIDimensions.horizontalSpace(20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.name,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                UIDimensions.verticalSpace(10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: onDecreaseTapped,
                      child: Container(
                        padding: UIDimensions.symmetricPaddingInsets(
                          horizontal: 5,
                          vertical: 4,
                        ),
                        decoration: UIDimensions.shapeDecoration(
                          boxColor: AppColors.filterBackground,
                          borderColor: Colors.transparent,
                          cornerRadius: 10,
                        ),
                        child: Icon(
                          PhosphorIconsThin.minus,
                          size: UIDimensions.iconSize(20),
                        ),
                      ),
                    ),
                    UIDimensions.horizontalSpace(10),
                    Text(
                      quantity.toString(),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    UIDimensions.horizontalSpace(10),
                    GestureDetector(
                      onTap: onIncreaseTapped,
                      child: Container(
                        padding: UIDimensions.symmetricPaddingInsets(
                          horizontal: 5,
                          vertical: 4,
                        ),
                        decoration: UIDimensions.shapeDecoration(
                          boxColor: AppColors.filterBackground,
                          borderColor: Colors.transparent,
                          cornerRadius: 10,
                        ),
                        child: Icon(
                          PhosphorIconsThin.plus,
                          size: UIDimensions.iconSize(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          UIDimensions.horizontalSpace(20),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${(dish.price * quantity).toStringAsFixed(2)}',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
