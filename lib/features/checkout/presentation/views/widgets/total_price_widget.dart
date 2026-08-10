import 'package:flutter/material.dart';
import 'package:payment_method_app/core/utils/styles.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key, required this.title, required this.value});
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title, textAlign: TextAlign.center, style: Styles.textStyle18),
      Spacer(),
       Text(value, textAlign: TextAlign.center, style: Styles.textStyle18)],
    );
  }
}