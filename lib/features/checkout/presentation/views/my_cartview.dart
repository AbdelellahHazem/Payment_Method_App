import 'package:flutter/material.dart';
import 'package:payment_method_app/core/widgets/custom_app_bar.dart';
import 'package:payment_method_app/features/checkout/presentation/views/my_cart_viewbody.dart';

class MyCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: 'My Cart', context: context),
      body: MyCartViewBody(),
    );
  }

  
}
