import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_method_app/features/checkout/data/repos/checkout_repo.dart';
import 'package:payment_method_app/features/checkout/presentation/manager/payment%20_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit({required this.checkoutRepo}) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makepayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymnetLoading());
    var data = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    data.fold(
      (l) => emit(PaymentFailure(l.errMessege)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentStates> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
