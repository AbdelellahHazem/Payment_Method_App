import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method_app/core/utils/api_keys.dart';
import 'package:payment_method_app/features/checkout/presentation/views/my_cartview.dart';

void main() {
  Stripe.publishableKey = ApiKeys.puplishablekey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyCartView(),
    );
  }
}
