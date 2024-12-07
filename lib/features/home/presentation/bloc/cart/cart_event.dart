part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddDish extends CartEvent {
  const AddDish(this.dish, this.quantity);
  final DishEntity dish;
  final int quantity;

  @override
  List<Object?> get props => [dish, quantity];
}

class RemoveDish extends CartEvent {
  const RemoveDish(this.dish);
  final DishEntity dish;

  @override
  List<Object?> get props => [dish];
}

class UpdateCutleryQuantity extends CartEvent {
  const UpdateCutleryQuantity(this.quantity);
  final int quantity;

  @override
  List<Object?> get props => [quantity];
}
