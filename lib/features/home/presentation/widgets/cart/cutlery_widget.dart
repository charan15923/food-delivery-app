import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../bloc/cart/cart_bloc.dart';

class CutleryWidget extends StatelessWidget {
  const CutleryWidget({
    required this.onDecreaseTapped,
    required this.onIncreaseTapped,
    super.key,
  });
  final VoidCallback onIncreaseTapped;
  final VoidCallback onDecreaseTapped;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              width: UIDimensions.width(80),
              height: UIDimensions.width(60),
              child: Center(
                child: Icon(
                  PhosphorIconsBold.forkKnife,
                  size: UIDimensions.iconSize(20),
                  color: AppColors.black,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Cutlery',
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.black,
                fontSize: UIDimensions.font16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: onDecreaseTapped,
                  child: Container(
                    padding: UIDimensions.symmetricPaddingInsets(
                      horizontal: 5,
                      vertical: 4,
                    ),
                    decoration: UIDimensions.shapeDecoration(
                      boxColor: AppColors.filterBackground,
                      borderColor: Colors.transparent,
                      cornerRadius: 10,
                    ),
                    child: Icon(
                      PhosphorIconsThin.minus,
                      size: UIDimensions.iconSize(20),
                    ),
                  ),
                ),
                UIDimensions.horizontalSpace(10),
                Text(
                  '${state.cutleryQuantity}',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                UIDimensions.horizontalSpace(10),
                GestureDetector(
                  onTap: onIncreaseTapped,
                  child: Container(
                    padding: UIDimensions.symmetricPaddingInsets(
                      horizontal: 5,
                      vertical: 4,
                    ),
                    decoration: UIDimensions.shapeDecoration(
                      boxColor: AppColors.filterBackground,
                      borderColor: Colors.transparent,
                      cornerRadius: 10,
                    ),
                    child: Icon(
                      PhosphorIconsThin.plus,
                      size: UIDimensions.iconSize(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
