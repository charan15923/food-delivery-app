import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    required this.dish,
    required this.quantity,
    required this.onTap,
    super.key,
  });

  final DishEntity dish;
  final int quantity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: UIDimensions.symmetricPaddingInsets(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: UIDimensions.shapeDecoration(
          boxColor: AppColors.black,
          cornerRadius: 10,
          borderColor: AppColors.black,
        ),
        child: Row(
          children: [
            Text(
              'Add to cart',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              '\$${(dish.price * quantity).toStringAsFixed(2)}',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
