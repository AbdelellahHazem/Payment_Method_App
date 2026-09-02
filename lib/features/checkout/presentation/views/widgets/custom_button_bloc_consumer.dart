import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_method_app/core/utils/api_keys.dart';
import 'package:payment_method_app/core/widgets/custom_button.dart';
import 'package:payment_method_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_method_app/features/checkout/data/models/amount_model/details.dart';
import 'package:payment_method_app/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment_method_app/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment_method_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_method_app/features/checkout/presentation/manager/payment%20_states.dart';
import 'package:payment_method_app/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_method_app/features/checkout/presentation/views/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.ispaypal});
  final bool ispaypal;

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
            if (ispaypal) {
              var transactionsdata = getTransactions();

              executePaypalpayment(context, transactionsdata);
            } else {
              executestripepayment(context);
            }
          },
          isloading: state is PaymnetLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }

  void executestripepayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      customerId: 'cus_VBGelGSFdHO59P',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makepayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePaypalpayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionsdata,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientID,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsdata.amount.toJson(),
              "description": "The payment transaction description.",
              // "payment_options": {
              //   "allowed_payment_method":
              //       "INSTANT_FUNDING_SOURCE"
              // },
              "item_list": transactionsdata.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactions() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(name: 'Apple', quantity: 4, price: '10', currency: 'USD'),
      OrderItemModel(
        name: 'Pineapple',
        quantity: 5,
        price: '12',
        currency: 'USD',
      ),
    ];

    var itemList = ItemListModel(items: orders);
    return (amount: amount, itemList: itemList);
  }
}
