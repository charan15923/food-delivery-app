import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';

class FilterItemWidget extends StatelessWidget {
  const FilterItemWidget({
    required this.filterName,
    super.key,
  });
  final String filterName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UIDimensions.shapeDecoration(
        cornerRadius: 10,
        borderColor: Colors.transparent,
        boxColor: AppColors.filterBackground,
      ),
      margin: EdgeInsets.only(left: UIDimensions.width(10)),
      padding: UIDimensions.symmetricPaddingInsets(
        horizontal: 20,
        vertical: 5,
      ),
      child: Center(
        child: Text(
          filterName,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.black,
            fontSize: UIDimensions.font14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
