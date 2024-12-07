import 'package:flutter/material.dart';

import '../../../../../core/common/bottom_sheet_service.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';
import '../../dish_details_screen.dart';

class DishHorizontalItemWidget extends StatefulWidget {
  const DishHorizontalItemWidget({
    required this.dish,
    super.key,
  });
  final DishEntity dish;
  @override
  State<DishHorizontalItemWidget> createState() =>
      _DishHorizontalItemWidgetState();
}

class _DishHorizontalItemWidgetState extends State<DishHorizontalItemWidget> {
  List<Color> selectedColors = AppColors.gradientColors[0];
  @override
  void initState() {
    super.initState();
    selectedColors = AppColors.gradientColors[widget.dish.gradientIndex];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BottomSheetService.showBottomSheet<void>(
          context,
          DishDetailsScreen(dish: widget.dish),
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final topPadding = constraints.maxHeight * 0.1;
          final imageHeight = constraints.maxHeight * 0.6;
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: topPadding),
                decoration: UIDimensions.shapeDecoration(
                  borderColor: Colors.transparent,
                  cornerRadius: 20,
                  gradient: LinearGradient(
                    colors: selectedColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: widget.dish.image.image(
                      width: UIDimensions.width(imageHeight),
                      height: UIDimensions.height(imageHeight),
                      fit: BoxFit.contain,
                    ),
                  ),
                  UIDimensions.verticalSpace(20),
                  UIDimensions.padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.dish.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: AppColors.black,
                              fontSize: UIDimensions.font16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        UIDimensions.horizontalSpace(50),
                        Container(
                          padding: UIDimensions.symmetricPaddingInsets(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: const ShapeDecoration(
                            color: AppColors.black,
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            '\$${widget.dish.price}',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
