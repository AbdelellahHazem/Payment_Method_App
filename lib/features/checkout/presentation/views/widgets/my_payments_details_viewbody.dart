import 'package:flutter/material.dart';
import 'package:payment_method_app/core/widgets/custom_button.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:payment_method_app/features/checkout/presentation/views/widgets/payment_methods_listview.dart';


class MyPaymentsDetailsViewBody extends StatefulWidget {
  const MyPaymentsDetailsViewBody({super.key});

  @override
  State<MyPaymentsDetailsViewBody> createState() => _MyPaymentsDetailsViewBodyState();
}

class _MyPaymentsDetailsViewBodyState extends State<MyPaymentsDetailsViewBody> {
   final GlobalKey<FormState> formKey = GlobalKey();
   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
         child:MypaymentMethodListview()
        ),
        SliverToBoxAdapter(
          child:CustomCreditCard(formKey: formKey, autovalidateMode: autovalidateMode,)
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:12, left: 16, right: 16),
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                  else {

                      autovalidateMode = AutovalidateMode.always;
                    setState(() {
                    
                    });
                  }
                  
                },
                text: ' Payment',
              
              ),
            ),
          ),

        )
      ],
    );
  }
}


