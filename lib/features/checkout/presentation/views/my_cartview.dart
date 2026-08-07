import 'package:flutter/material.dart';
import 'package:payment_method_app/core/utils/styles.dart';

class MyCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('My Cart',style: Styles.textStyle25,),));
  }
}
