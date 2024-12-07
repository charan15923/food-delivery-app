import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/ui_dimensions.dart';
import 'bloc/cart/cart_bloc.dart';
import 'widgets/cart/cart_bottom_bar_widget.dart';
import 'widgets/cart/cart_cutlery_section.dart';
import 'widgets/cart/cart_delivery_payment_section.dart';
import 'widgets/cart/cart_header_widget.dart';
import 'widgets/cart/cart_items_list_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state.items.isEmpty) {
          context.pop();
        }
      },
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAlias,
          padding: UIDimensions.symmetricPaddingInsets(horizontal: 20),
          decoration: const ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.only(
                topLeft: SmoothRadius(cornerRadius: 40, cornerSmoothing: 1),
                topRight: SmoothRadius(cornerRadius: 40, cornerSmoothing: 1),
              ),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIDimensions.verticalSpace(40),
                  const CartHeaderWidget(),
                  UIDimensions.verticalSpace(20),
                  CartItemsListWidget(
                    items: state.items,
                    onIncreaseTapped: (dish) {
                      context.read<CartBloc>().add(AddDish(dish, 1));
                    },
                    onDecreaseTapped: (dish) {
                      context.read<CartBloc>().add(RemoveDish(dish));
                    },
                  ),
                  UIDimensions.verticalSpace(10),
                  CartCutlerySection(
                    onDecrease: () => context
                        .read<CartBloc>()
                        .add(const UpdateCutleryQuantity(-1)),
                    onIncrease: () => context
                        .read<CartBloc>()
                        .add(const UpdateCutleryQuantity(1)),
                  ),
                  const CartDeliveryPaymentSection(),
                ],
              ),
            ),
            bottomNavigationBar:
                CartBottomBarWidget(totalPrice: state.totalPrice),
          ),
        );
      },
    );
  }
}
