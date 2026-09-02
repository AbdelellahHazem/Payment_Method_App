import 'package:flutter/material.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/payments_method_item.dart';

class MypaymentMethodListview extends StatefulWidget {
  const MypaymentMethodListview({super.key, required this.updatePaymentMethod});

  final Function({required int index}) updatePaymentMethod;
  @override
  State<MypaymentMethodListview> createState() =>
      _MypaymentMethodListviewState();
}

class _MypaymentMethodListviewState extends State<MypaymentMethodListview> {
  List<String> paymentMethods = [
    'assets/images/card.png',
    'assets/images/paypal_logo.png.png',
  ];

  int activeIndex = 0;

  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                  widget.updatePaymentMethod(index: activeIndex);
                });
              },
              child: PaymentMethodItem(
                isSelected: index == activeIndex,
                imagePath: paymentMethods[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
