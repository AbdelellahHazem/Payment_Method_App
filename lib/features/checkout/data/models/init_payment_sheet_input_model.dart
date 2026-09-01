class InitPaymentSheetInputModel {
  final String ClientSecret;
  final String EphemeralKeySecret;
  final String CustomerId;
  InitPaymentSheetInputModel({
    required this.ClientSecret,
    required this.EphemeralKeySecret,
    required this.CustomerId,
  });
}
