import 'package:flutter/material.dart';
import 'package:payment_method_app/core/utils/styles.dart';

AppBar buildAppbar({required BuildContext context, String? title}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(title ?? '', style: Styles.textStyle25),
  );
}
