import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';

class DeliveryFeeWidget extends StatelessWidget {
  const DeliveryFeeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Delivery',
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.black,
          fontSize: UIDimensions.font16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: UIDimensions.padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          r'Free delivery from $30',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.grey_400,
            fontSize: UIDimensions.font16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      trailing: Text(
        r'$0.00',
        style: context.textTheme.bodyMedium?.copyWith(
          color: AppColors.black,
          fontSize: UIDimensions.font16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
