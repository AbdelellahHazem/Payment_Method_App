import 'package:flutter/material.dart';
import 'package:payment_method_app/core/widgets/custom_app_bar.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/my_payments_details_viewbody.dart';

class PaymentsDetails extends StatelessWidget {
  const PaymentsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: 'Payment Details', context: context),
      body: MyPaymentsDetailsViewBody(),
    );
  }
}