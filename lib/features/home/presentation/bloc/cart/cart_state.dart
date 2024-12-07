part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({
    this.items = const {},
    this.cutleryQuantity = 0,
    this.totalPrice = 0.0,
  });
  final Map<DishEntity, int> items;
  final int cutleryQuantity;
  final double totalPrice;

  CartState copyWith({
    Map<DishEntity, int>? items,
    int? cutleryQuantity,
    double? totalPrice,
  }) {
    return CartState(
      items: items ?? this.items,
      cutleryQuantity: cutleryQuantity ?? this.cutleryQuantity,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [items, cutleryQuantity, totalPrice];
}
