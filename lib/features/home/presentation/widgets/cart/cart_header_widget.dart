import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';

class CartHeaderWidget extends StatelessWidget {
  const CartHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'We will deliver in \n24 minutes to the address',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.black,
            fontSize: UIDimensions.fontSize(20),
            fontWeight: FontWeight.w700,
          ),
        ),
        UIDimensions.verticalSpace(20),
        Row(
          children: [
            Text(
              '100a Ealing Rd',
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.black,
                fontSize: UIDimensions.font16,
                fontWeight: FontWeight.w500,
              ),
            ),
            UIDimensions.horizontalSpace(10),
            Text(
              'Change address',
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.grey_400,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
