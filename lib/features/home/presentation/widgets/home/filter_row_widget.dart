import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import 'filter_item_widget.dart';

class FilterRowWidget extends StatelessWidget {
  FilterRowWidget({super.key});

  final filtersList = [
    'Pizza',
    'Pasta',
    'Salad',
    'Soup',
    'Dessert',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: UIDimensions.height(40),
      margin: EdgeInsets.only(
        left: UIDimensions.width(20),
      ),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            decoration: UIDimensions.shapeDecoration(
              cornerRadius: 10,
              borderColor: Colors.transparent,
              boxColor: AppColors.filterBackground,
            ),
            padding: UIDimensions.symmetricPaddingInsets(
              horizontal: 20,
              vertical: 5,
            ),
            child: Center(
              child: Icon(
                PhosphorIconsRegular.fadersHorizontal,
                size: UIDimensions.icon24,
              ),
            ),
          ),
          ...filtersList.map(
            (filter) => FilterItemWidget(filterName: filter),
          ),
        ],
      ),
    );
  }
}
