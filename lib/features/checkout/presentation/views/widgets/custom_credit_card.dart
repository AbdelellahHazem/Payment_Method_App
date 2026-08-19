import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({Key? key, required this.formKey, required this.autovalidateMode}) : super(key: key);
   final GlobalKey<FormState> formKey;
   final AutovalidateMode autovalidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '' , expiryDate = '' , cardHolderName = '' , cvvCode = '' ;

  bool showBackView=false ;
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              isHolderNameVisible: true,
              onCreditCardWidgetChange: (CreditCardBrand) {},
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (CreditCardModel) {
                  cardNumber = CreditCardModel.cardNumber;
                  expiryDate = CreditCardModel.expiryDate;
                  cardHolderName = CreditCardModel.cardHolderName;
                  cvvCode = CreditCardModel.cvvCode;
                  showBackView = CreditCardModel.isCvvFocused;
                setState(() {
                
                });
              },
              formKey: widget.formKey,
              autovalidateMode: widget.autovalidateMode,
            ),
            
      ]
    );
  }
}
