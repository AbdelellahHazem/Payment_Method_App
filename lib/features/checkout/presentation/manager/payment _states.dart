abstract class PaymentStates {}

class PaymentInitial extends PaymentStates {}

class PaymnetLoading extends PaymentStates {}

class PaymentFailure extends PaymentStates {
  final String errmesege;
  PaymentFailure(this.errmesege);
}

class PaymentSuccess extends PaymentStates {}
