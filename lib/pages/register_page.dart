import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_border.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/custom_text_style.dart';
import 'package:wooow_supermarket/utils/custom_utils.dart';
import 'package:wooow_supermarket/utils/global.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const Expanded(
              child: Image(
                  image: AssetImage("assets/images/topbar-icon.png"),
                  height: 140,
                  alignment: Alignment.center,
                  width: 200),
              flex: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Name",
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular
                                .copyWith(
                                fontSize:
                                MediaQuery.of(context).textScaleFactor *
                                    16,
                                color: Colors.black), floatingLabelBehavior: FloatingLabelBehavior.auto),
                        keyboardType: TextInputType.text),
                    Utils.getSizedBox(height: 15),
                    TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Mobile Number",
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular
                                .copyWith(
                                fontSize:
                                MediaQuery.of(context).textScaleFactor *
                                    16,
                                color: Colors.black), floatingLabelBehavior: FloatingLabelBehavior.auto),
                        keyboardType: TextInputType.number),
                    Utils.getSizedBox(height: 15),
                    TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Email",
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldRegular
                                .copyWith(
                                fontSize:
                                MediaQuery.of(context).textScaleFactor *
                                    16,
                                color: Colors.black), floatingLabelBehavior: FloatingLabelBehavior.auto),
                        keyboardType: TextInputType.emailAddress),
                    Utils.getSizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                          border: CustomBorder.enabledBorder,
                          labelText: "Password",
                          focusedBorder: CustomBorder.focusBorder,
                          errorBorder: CustomBorder.errorBorder,
                          enabledBorder: CustomBorder.enabledBorder,
                          labelStyle: CustomTextStyle.textFormFieldRegular
                              .copyWith(
                              fontSize:
                              MediaQuery.of(context).textScaleFactor *
                                  16,
                              color: Colors.black), floatingLabelBehavior: FloatingLabelBehavior.auto),
                      obscureText: true,
                    ),
                    Utils.getSizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: getButtonStyle(),
                        onPressed: () {},
                        child: Text(
                          "SIGNUP",
                          style: CustomTextStyle.textFormFieldRegular
                              .copyWith(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    Utils.getSizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.grey.shade200,
                            margin: EdgeInsets.only(right: 16),
                            height: 1,
                          ),
                          flex: 40,
                        ),
                        Text(
                          "Or",
                          style: CustomTextStyle.textFormFieldMedium
                              .copyWith(fontSize: 14),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.grey.shade200,
                            margin: const EdgeInsets.only(left: 16),
                            height: 1,
                          ),
                          flex: 40,
                        )
                      ],
                    ),
                    Utils.getSizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "تسجيل باستخدام FACEBOOK",
                            textDirection: TextDirection.rtl,
                            style: CustomTextStyle.textFormFieldMedium
                                .copyWith(color: Colors.white, fontSize: 14),
                          ),
                          style: getButtonStyle()
                      ),
                    ),
                    Utils.getSizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "تسجيل باستخدام GOOGLE",
                            textDirection: TextDirection.rtl,
                            style: CustomTextStyle.textFormFieldMedium
                                .copyWith(color: Colors.white, fontSize: 14),
                          ),
                          style: getButtonStyle()
                      ),
                    ),
                    Utils.getSizedBox(height: 10),
                  ],
                ),
              ),
              flex: 80,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}