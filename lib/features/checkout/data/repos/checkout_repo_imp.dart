import 'package:dartz/dartz.dart';
import 'package:payment_method_app/core/errors/failures.dart';
import 'package:payment_method_app/core/utils/stripe_service.dart';
import 'package:payment_method_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_method_app/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImp extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailures(errMessege: e.toString()));
    }
  }
}
