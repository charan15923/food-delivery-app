import 'package:flutter/material.dart';

import '../../../../../core/common/bottom_sheet_service.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';
import '../../dish_details_screen.dart';

class DishVerticalItemWidget extends StatelessWidget {
  const DishVerticalItemWidget({
    required this.dish,
    super.key,
  });

  final DishEntity dish;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BottomSheetService.showBottomSheet<void>(
          context,
          DishDetailsScreen(dish: dish),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(UIDimensions.radius(240)),
              child: dish.image.image(
                width: UIDimensions.width(120),
                height: UIDimensions.width(120),
                fit: BoxFit.cover,
              ),
            ),
            UIDimensions.horizontalSpace(20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dish Name
                  Text(
                    dish.name,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  UIDimensions.verticalSpace(10),

                  // Price & Calories Row
                  Row(
                    children: [
                      Container(
                        padding: UIDimensions.symmetricPaddingInsets(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: const ShapeDecoration(
                          color: AppColors.filterBackground,
                          shape: StadiumBorder(),
                        ),
                        child: Text(
                          '\$${dish.price}',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      UIDimensions.horizontalSpace(20),
                      Text(
                        '${dish.calories} kcal',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.grey_400,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
