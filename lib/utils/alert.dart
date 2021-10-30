import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'global.dart';

showSuccessDialog(BuildContext context, String title, String desc) {
  Alert(
      context: context,
      title: title,
      desc: desc,
      image: const Image(
        height: 50,
        image: AssetImage("assets/images/success.png"),
      ),
      buttons: [
        DialogButton(
          child: const Text(
            "حسناً",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: getPrimaryColor(),
        ),
      ]).show();
}

showErrorDialog(BuildContext context, String title, String desc) {
  Alert(
      context: context,
      title: title,
      desc: desc,
      image: const Image(
        height: 50,
        image: AssetImage("assets/images/error.png"),
      ),
      buttons: [
        DialogButton(
          child: const Text(
            "حسناً",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: getPrimaryColor(),
        ),
      ]).show();
}
