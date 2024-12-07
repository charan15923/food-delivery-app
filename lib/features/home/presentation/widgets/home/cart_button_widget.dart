import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/bottom_sheet_service.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/context_extension.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../cart_screen.dart';

class CartButtonWidget extends StatelessWidget {
  const CartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final hasItems = state.items.isNotEmpty;
        log(state.items.toString());

        return AnimatedSlide(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          offset: hasItems ? Offset.zero : const Offset(0, 1),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            opacity: hasItems ? 1.0 : 0.0,
            child: GestureDetector(
              onTap: () {
                BottomSheetService.showBottomSheet<void>(
                  context,
                  const CartScreen(),
                );
              },
              child: Container(
                padding: UIDimensions.symmetricPaddingInsets(
                  horizontal: 20,
                  vertical: 15,
                ),
                margin: UIDimensions.onlyPaddingInsets(left: 30),
                decoration: UIDimensions.shapeDecoration(
                  borderColor: Colors.transparent,
                  cornerRadius: 20,
                  boxColor: AppColors.black,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Cart',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: UIDimensions.font16,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '24 min',
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: UIDimensions.font14,
                          ),
                        ),
                        UIDimensions.horizontalSpace(10),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 2,
                        ),
                        UIDimensions.horizontalSpace(10),
                        Text(
                          '\$${state.totalPrice}',
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: UIDimensions.font16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
