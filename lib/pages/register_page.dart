import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_border.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/custom_text_style.dart';
import 'package:wooow_supermarket/utils/custom_utils.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/validators.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              child: Image(image: AssetImage("assets/images/topbar-icon.png"), height: 140, alignment: Alignment.center, width: 200),
              flex: 35,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Form(
                        key: _formKey,
                        child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              children: [
                                TextFormField(
                                    controller: emailController,
                                    validator: (value) => Validators().validateEmail(value),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                                      border: CustomBorder.enabledBorder,
                                      labelText: "البريد الالكتروني",
                                      focusedBorder: CustomBorder.focusBorder,
                                      errorBorder: CustomBorder.errorBorder,
                                      enabledBorder: CustomBorder.enabledBorder,
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    ),
                                    keyboardType: TextInputType.emailAddress),
                                Utils.getSizedBox(height: 15),
                                TextFormField(
                                  controller: passwordController,
                                  validator: (value) => Validators().validatePassword(value),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                                      border: CustomBorder.enabledBorder,
                                      labelText: "كلمة المرور",
                                      focusedBorder: CustomBorder.focusBorder,
                                      errorBorder: CustomBorder.errorBorder,
                                      enabledBorder: CustomBorder.enabledBorder,
                                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                                  obscureText: true,
                                ),
                                Utils.getSizedBox(height: 15),
                                SizedBox(
                                  width: double.infinity,
                                  child: SignInButton(
                                    Buttons.Email,
                                    text: "تسجيل باستخدام البريد الالكتروني",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Processing Data')),
                                        );
                                        auth.createWithCredentials(emailController.text, passwordController.text);
                                      }
                                    },
                                  ),
                                ),
                                Utils.getSizedBox(height: 10),
                              ],
                            ))),
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
                          style: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: 14),
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
                      child: SignInButton(
                        Buttons.Facebook,
                        text: "تسجيل باستخدام Facebook",
                        onPressed: () {},
                      ),
                    ),
                    Utils.getSizedBox(height: 10),
                    SizedBox(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          text: "تسجيل باستخدام GOOGLE",
                          onPressed: () {
                            auth.signInWithGoogle();
                          },
                        )

                        // ElevatedButton(
                        //     onPressed: () {
                        //       auth.signInWithGoogle();
                        //     },
                        //     child: Text(
                        //       "تسجيل باستخدام GOOGLE",
                        //       textDirection: TextDirection.rtl,
                        //       style: CustomTextStyle.textFormFieldMedium
                        //           .copyWith(color: Colors.white, fontSize: 14),
                        //     )
                        // )

                        ),
                    Utils.getSizedBox(height: 10),
                  ],
                ),
              ),
              flex: 65,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
