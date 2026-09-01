import 'package:flutter/material.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/payment_methods_listview.dart';

class PaymentMethodsButtonSheet extends StatelessWidget {
  const PaymentMethodsButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MypaymentMethodListview(),
          SizedBox(height: 30),
          CustomButtonBlocConsumer(),
        ],
      ),
    );
  }
}
