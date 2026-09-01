import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method_app/core/widgets/custom_button.dart';
import 'package:payment_method_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_method_app/features/checkout/presentation/manager/payment%20_states.dart';
import 'package:payment_method_app/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_method_app/features/checkout/presentation/views/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView();
              },
            ),
          );
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errmesege));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
                  amount: '100',
                  currency: 'USD',
                  customerId: 'cus_VBGelGSFdHO59P',
                );
            BlocProvider.of<PaymentCubit>(
              context,
            ).makepayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isloading: state is PaymnetLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }
}
