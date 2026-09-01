import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_method_app/core/utils/styles.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/card_info_widget.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/total_price_widget.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 20, right: 20),
        child: Column(
          children: [
            const Text(
              'Thank You!',
              style: Styles.textStyle25,
              textAlign: TextAlign.center,
            ),
            Text(
              'Your transaction was successful.',
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 42),
            PaymentItemInfo(title: 'Date', value: '12/12/2023'),
            SizedBox(height: 20),
            PaymentItemInfo(title: 'Time', value: '12:00 PM'),
            SizedBox(height: 20),
            PaymentItemInfo(title: 'To', value: 'Sam Louis'),
            Divider(height: 60, color: Colors.black, thickness: 2),
            TotalPriceWidget(title: 'Total', value: r' $50.78'),
            SizedBox(height: 30),
            CardInfoWidget(),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) + 100,
              // -40ish to leave room for the row itself; tweak to taste
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const FaIcon(FontAwesomeIcons.barcode, size: 64),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: Color(0xFF34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle24.copyWith(
                        color: const Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
