import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';

class CartBottomBarWidget extends StatelessWidget {
  const CartBottomBarWidget({
    required this.totalPrice,
    super.key,
  });

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: UIDimensions.onlyPaddingInsets(
        bottom: 40,
      ),
      padding: UIDimensions.symmetricPaddingInsets(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: UIDimensions.shapeDecoration(
        borderColor: Colors.transparent,
        cornerRadius: 20,
        boxColor: AppColors.black,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Pay',
              style: context.textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: UIDimensions.font16,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '24 min',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: UIDimensions.font14,
                ),
              ),
              UIDimensions.horizontalSpace(10),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 2,
              ),
              UIDimensions.horizontalSpace(10),
              Text(
                '\$$totalPrice',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: UIDimensions.font16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
