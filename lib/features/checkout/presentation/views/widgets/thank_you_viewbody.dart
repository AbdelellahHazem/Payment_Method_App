import 'package:flutter/material.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/custom_dashed_Line.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewbody extends StatelessWidget {
  const ThankYouViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        children: [
          ThankYouCard(),

          Positioned(
            bottom: MediaQuery.of(context).size.height * .2 + 20,
            left: 0,
            right: 0,
            child: CustomDashedLine(),
          ),

          Positioned(
            left: -20,
            bottom: MediaQuery.of(context).size.height * .2,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),

          Positioned(
            right: -20,
            bottom: MediaQuery.of(context).size.height * .2,
            child: CircleAvatar(backgroundColor: Colors.white),
          ),

          Positioned(top: -15, left: 0, right: 0, child: CustomCheckIcon()),
        ],
      ),
    );
  }
}
