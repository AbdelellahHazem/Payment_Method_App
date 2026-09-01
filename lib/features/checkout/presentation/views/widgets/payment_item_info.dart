import 'package:flutter/material.dart';
import 'package:payment_method_app/core/utils/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Styles.textStyle18, textAlign: TextAlign.center),
        Text(value, style: Styles.textStyle1Bold8, textAlign: TextAlign.center),
      ],
    );
  }
}
