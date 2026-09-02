import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method_app/core/widgets/custom_button.dart';
import 'package:payment_method_app/features/checkout/data/repos/checkout_repo_imp.dart';
import 'package:payment_method_app/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/cart_info_item.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/payment_methods_button_sheet.dart';
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
            Expanded(child: Image.asset('assets/images/img.png')),
            SizedBox(height: 25),
            OrderInfoItem(title: 'Order Subtotal', value: '\$ 42.97'),
            SizedBox(height: 15),
            OrderInfoItem(title: 'Discount', value: '\$0'),
            SizedBox(height: 15),
            OrderInfoItem(title: 'Shipping', value: '\$8'),

            Divider(color: Colors.black, thickness: 2),
            SizedBox(height: 15),
            TotalPriceWidget(title: 'Total', value: '\$50.97'),
            SizedBox(height: 16),
            CustomButton(
              text: 'Complete Payment',
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentsDetails()));

                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          PaymentCubit(checkoutRepo: CheckoutRepoImp()),
                      child: PaymentMethodsButtonSheet(),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
