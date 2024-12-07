import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';

class DishValueItemWidget extends StatelessWidget {
  const DishValueItemWidget({
    required this.title,
    required this.value,
    super.key,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: UIDimensions.padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Text(
              value,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            UIDimensions.verticalSpace(5),
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.grey_300,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
