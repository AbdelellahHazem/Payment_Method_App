import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_method_app/core/utils/api_keys.dart';
import 'package:payment_method_app/core/utils/api_service.dart';
import 'package:payment_method_app/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_method_app/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:payment_method_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_method_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final String secretKey = '';
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretkey,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initpaymentsheetinputmodel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initpaymentsheetinputmodel.ClientSecret,
        customerEphemeralKeySecret:
            initpaymentsheetinputmodel.EphemeralKeySecret,
        customerId: initpaymentsheetinputmodel.CustomerId,
        merchantDisplayName: 'Aa',
      ),
    );
  }

  Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntent = await createPaymentIntent(paymentIntentInputModel);
    var ephermalkeymodel = await createEpheremalKey(
      customerId: paymentIntentInputModel.customerId,
    );

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      ClientSecret: paymentIntent.clientSecret!,
      EphemeralKeySecret: ephermalkeymodel.secret!,
      CustomerId: paymentIntentInputModel.customerId,
    );
    await initPaymentSheet(
      initpaymentsheetinputmodel: initPaymentSheetInputModel,
    );
    await presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEpheremalKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretkey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretkey}',
        'Stripe-Version': '2023-08-16',
      },
    );
    return EphemeralKeyModel.fromJson(response.data);
  }
}
