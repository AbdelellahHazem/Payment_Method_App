import 'package:flutter/material.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/cart_info_item.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/total_price_widget.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 18),
            Image.asset('assets/images/img.png'),
            SizedBox(height: 25),
            OrderInfoItem(title: 'Order Subtotal', value: '\$ 42.97'),
            SizedBox(height: 15),
            OrderInfoItem(title: 'Discount', value: '\$0'),
            SizedBox(height: 15),
            OrderInfoItem(title: 'Shipping', value: '\$8'),

            Divider(color: Colors.black, thickness: 2),
            SizedBox(height: 15),
            TotalPriceWidget(title: 'Total', value: '\$50.97'),
          ],
        ),
      ),
    );
  }
}
