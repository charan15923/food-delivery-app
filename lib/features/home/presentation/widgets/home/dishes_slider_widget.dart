import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../../domain/entities/dish_entity.dart';
import 'dish_horizontal_item_widget.dart';

class DishesSliderWidget extends StatefulWidget {
  const DishesSliderWidget({
    required this.sliderItems,
    super.key,
  });

  final List<DishEntity> sliderItems;

  @override
  State<DishesSliderWidget> createState() => _DishesSliderWidgetState();
}

class _DishesSliderWidgetState extends State<DishesSliderWidget> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      final nextPage = _pageController.page?.round() ?? 0;
      if (_currentIndex != nextPage) {
        setState(() {
          _currentIndex = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final n = widget.sliderItems.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIDimensions.verticalSpace(20),
        UIDimensions.padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Hits of the week',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: context.textTheme.titleLarge?.copyWith(
              color: AppColors.black,
              fontSize: UIDimensions.font18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        UIDimensions.verticalSpace(10),
        UIDimensions.padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: UIDimensions.height(250),
            child: PageView(
              controller: _pageController,
              children: List.generate(
                n,
                (index) => UIDimensions.padding(
                  padding: const EdgeInsets.all(8),
                  child:
                      DishHorizontalItemWidget(dish: widget.sliderItems[index]),
                ),
              ),
            ),
          ),
        ),
        UIDimensions.verticalSpace(10),
        UIDimensions.padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final totalWidth = constraints.maxWidth;
              const indicatorSpacing = 8.0;
              final adjustedDotWidth =
                  (totalWidth - (n - 1) * indicatorSpacing) / n;

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < n; i++) ...[
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: adjustedDotWidth,
                      height: UIDimensions.height(3),
                      decoration: BoxDecoration(
                        color: _currentIndex == i
                            ? AppColors.black
                            : AppColors.black.withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(UIDimensions.radius(3)),
                      ),
                    ),
                    if (i < n - 1) const SizedBox(width: indicatorSpacing),
                  ],
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
