import 'package:flutter/material.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/payment_methods_listview.dart';

class PaymentMethodsButtonSheet extends StatefulWidget {
  const PaymentMethodsButtonSheet({super.key});

  @override
  State<PaymentMethodsButtonSheet> createState() =>
      _PaymentMethodsButtonSheetState();
}

class _PaymentMethodsButtonSheetState extends State<PaymentMethodsButtonSheet> {
  bool ispaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      ispaypal = false;
    } else {
      ispaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MypaymentMethodListview(updatePaymentMethod: updatePaymentMethod),
          SizedBox(height: 30),
          CustomButtonBlocConsumer(ispaypal: ispaypal),
        ],
      ),
    );
  }
}
