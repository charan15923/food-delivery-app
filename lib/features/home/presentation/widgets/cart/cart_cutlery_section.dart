import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import 'cutlery_widget.dart';

class CartCutlerySection extends StatelessWidget {
  const CartCutlerySection({
    required this.onDecrease,
    required this.onIncrease,
    super.key,
  });

  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIDimensions.divider(
          thickness: 1,
          color: AppColors.grey_300,
        ),
        CutleryWidget(
          onDecreaseTapped: onDecrease,
          onIncreaseTapped: onIncrease,
        ),
        UIDimensions.divider(
          thickness: 1,
          color: AppColors.grey_300,
        ),
        UIDimensions.verticalSpace(20),
      ],
    );
  }
}
