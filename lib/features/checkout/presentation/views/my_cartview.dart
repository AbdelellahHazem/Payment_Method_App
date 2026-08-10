import 'package:flutter/material.dart';
import 'package:payment_method_app/core/utils/styles.dart';
import 'package:payment_method_app/features/checkout/presentation/views/my_cart_viewbody.dart';

class MyCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.arrow_back_outlined, color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text('My Cart', style: Styles.textStyle25),
      ),
      body: MyCartViewBody(),
    );
  }
}
