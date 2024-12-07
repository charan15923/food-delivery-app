import 'package:flutter/material.dart';
import '../../../../../core/utils/ui_dimensions.dart';
import 'delivery_fee_widget.dart';
import 'payment_method_widget.dart';

class CartDeliveryPaymentSection extends StatelessWidget {
  const CartDeliveryPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DeliveryFeeWidget(),
        UIDimensions.verticalSpace(20),
        const PaymentMethodWidget(),
      ],
    );
  }
}
