import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/ui_dimensions.dart';
import '../domain/entities/dish_entity.dart';
import 'bloc/cart/cart_bloc.dart';
import 'widgets/details_screen/add_in_poke_list_tile.dart';
import 'widgets/details_screen/add_to_cart_button.dart';
import 'widgets/details_screen/dish_image_widget.dart';
import 'widgets/details_screen/dish_name_description_widget.dart';
import 'widgets/details_screen/dish_nutritional_info_widget.dart';
import 'widgets/details_screen/quantity_selector.dart';

class DishDetailsScreen extends StatefulWidget {
  const DishDetailsScreen({
    required this.dish,
    super.key,
  });
  final DishEntity dish;

  @override
  State<DishDetailsScreen> createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.only(
            topLeft: SmoothRadius(cornerRadius: 40, cornerSmoothing: 1),
            topRight: SmoothRadius(cornerRadius: 40, cornerSmoothing: 1),
          ),
        ),
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIDimensions.verticalSpace(40),
            Center(child: DishImageWidget(dish: widget.dish)),
            UIDimensions.verticalSpace(40),
            UIDimensions.padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DishNameDescriptionWidget(dish: widget.dish),
                  UIDimensions.verticalSpace(20),
                  DishNutritionalInfoWidget(dish: widget.dish),
                  UIDimensions.verticalSpace(20),
                  const AddInPokeListTile(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: UIDimensions.symmetricPaddingInsets(horizontal: 20),
          margin: UIDimensions.onlyPaddingInsets(bottom: 40),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: QuantitySelector(
                  quantity: quantity,
                  onIncrement: _incrementQuantity,
                  onDecrement: _decrementQuantity,
                ),
              ),
              UIDimensions.horizontalSpace(20),
              Expanded(
                flex: 3,
                child: AddToCartButton(
                  dish: widget.dish,
                  quantity: quantity,
                  onTap: () {
                    context
                        .read<CartBloc>()
                        .add(AddDish(widget.dish, quantity));
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
