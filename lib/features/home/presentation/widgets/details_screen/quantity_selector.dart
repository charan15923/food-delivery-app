import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIDimensions.symmetricPaddingInsets(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: UIDimensions.shapeDecoration(
        boxColor: AppColors.filterBackground,
        cornerRadius: 10,
        borderColor: Colors.transparent,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              PhosphorIconsRegular.minus,
              color: AppColors.black,
              size: UIDimensions.iconSize(20),
            ),
          ),
          const Spacer(),
          Text(
            '$quantity',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              PhosphorIconsRegular.plus,
              color: AppColors.black,
              size: UIDimensions.iconSize(20),
            ),
          ),
        ],
      ),
    );
  }
}
