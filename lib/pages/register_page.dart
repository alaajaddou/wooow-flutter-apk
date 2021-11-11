import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_border.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/custom_text_style.dart';
import 'package:wooow_supermarket/utils/custom_utils.dart';
import 'package:wooow_supermarket/utils/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    nameController.dispose();
    super.dispose();
  }

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            const Expanded(
              child: Image(image: AssetImage("assets/images/topbar-icon.png"), height: 140, alignment: Alignment.center, width: 200),
              flex: 20,
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
                                    controller: nameController,
                                    validator: (value) => Validators.validateName(value),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                                      border: CustomBorder.enabledBorder,
                                      labelText: "الاسم",
                                      focusedBorder: CustomBorder.focusBorder,
                                      errorBorder: CustomBorder.errorBorder,
                                      enabledBorder: CustomBorder.enabledBorder,
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    ),
                                    keyboardType: TextInputType.text),
                                Utils.getSizedBox(height: 15),
                                TextFormField(
                                    controller: emailController,
                                    validator: (value) => Validators.validateEmail(value),
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
                                  validator: (value) => Validators.validatePassword(value),
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
                                TextFormField(
                                  controller: passwordConfirmationController,
                                  validator: (value) => Validators.validatePasswordConfirmation(value, passwordController.text),
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                                      border: CustomBorder.enabledBorder,
                                      labelText: "تأكيد كلمة المرور",
                                      focusedBorder: CustomBorder.focusBorder,
                                      errorBorder: CustomBorder.errorBorder,
                                      enabledBorder: CustomBorder.enabledBorder,
                                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                                  obscureText: true,
                                ),
                                Text(error, textDirection: TextDirection.rtl, style: const TextStyle(color: Colors.red)),
                                Utils.getSizedBox(height: 14),
                                SizedBox(
                                  width: double.infinity,
                                  child: SignInButton(
                                    Buttons.Email,
                                    text: "تسجيل باستخدام البريد الالكتروني",
                                    onPressed: () {
                                      error = '';
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Processing Data')),
                                        );

                                        dynamic data = {"email": emailController.text, "password": passwordController.text, "password_confirmation": passwordConfirmationController.text, "name": nameController.text};
                                        auth.createWithCredentials(data).then((authResponse) {
                                          if (authResponse['success'] != null) {
                                            List errorList = authResponse['data']!.keys.toList();
                                            if (errorList.isNotEmpty) {
                                              /* Error handling */
                                              String errorKey = authResponse['data'].keys.toList()[0];
                                              error = authResponse['data'][errorKey][0].toString();
                                              debugPrint(error);
                                            }
                                          }
                                        });
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
                            margin: const EdgeInsets.only(right: 16),
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
                            signInWithGoogle();
                          },
                        )),
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
