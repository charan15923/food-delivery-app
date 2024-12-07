import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment method',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.grey_400,
            fontSize: UIDimensions.font16,
            fontWeight: FontWeight.w300,
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            PhosphorIconsBold.paypalLogo,
            color: AppColors.black,
            size: UIDimensions.iconSize(16),
          ),
          title: Text(
            'PayPal',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: UIDimensions.font16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: AppColors.black,
            size: UIDimensions.iconSize(16),
          ),
        ),
      ],
    );
  }
}
