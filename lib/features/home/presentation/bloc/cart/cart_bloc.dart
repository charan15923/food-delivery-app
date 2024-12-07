import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/dish_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddDish>(_onAddDish);
    on<RemoveDish>(_onRemoveDish);
    on<UpdateCutleryQuantity>(_onUpdateCutleryQuantity);
  }

  void _onAddDish(AddDish event, Emitter<CartState> emit) {
    final newItems = Map<DishEntity, int>.from(state.items);
    if (newItems.containsKey(event.dish)) {
      newItems[event.dish] = newItems[event.dish]! + event.quantity;
    } else {
      newItems[event.dish] = event.quantity;
    }
    emit(
      state.copyWith(
        items: newItems,
        totalPrice: _calculateTotal(newItems, state.cutleryQuantity),
      ),
    );
  }

  void _onRemoveDish(RemoveDish event, Emitter<CartState> emit) {
    final newItems = Map<DishEntity, int>.from(state.items);
    if (newItems[event.dish]! > 1) {
      newItems[event.dish] = newItems[event.dish]! - 1;
    } else {
      newItems.remove(event.dish);
    }
    emit(
      state.copyWith(
        items: newItems,
        totalPrice: _calculateTotal(newItems, state.cutleryQuantity),
      ),
    );
  }

  void _onUpdateCutleryQuantity(
    UpdateCutleryQuantity event,
    Emitter<CartState> emit,
  ) {
    if (state.cutleryQuantity + event.quantity < 0) return;
    emit(
      state.copyWith(
        cutleryQuantity: state.cutleryQuantity + event.quantity,
      ),
    );
  }

  double _calculateTotal(Map<DishEntity, int> items, int cutleryQuantity) {
    var total = 0.0;
    for (final entry in items.entries) {
      final dish = entry.key;
      final qty = entry.value;
      total += dish.price * qty;
    }
    return total;
  }
}
