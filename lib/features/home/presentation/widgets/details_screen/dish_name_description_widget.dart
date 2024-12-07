import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';

class DishNameDescriptionWidget extends StatelessWidget {
  const DishNameDescriptionWidget({
    required this.dish,
    super.key,
  });

  final DishEntity dish;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dish.name,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.black,
            fontSize: UIDimensions.font20,
            fontWeight: FontWeight.w700,
          ),
        ),
        UIDimensions.verticalSpace(10),
        Text(
          dish.description,
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.grey_400,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
