import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/GoogleSignInController.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_border.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/custom_text_style.dart';
import 'package:wooow_supermarket/utils/custom_utils.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const Expanded(
                child: Image(image: AssetImage("assets/images/topbar-icon.png"), height: 100, alignment: Alignment.bottomCenter, width: 200),
                flex: 25,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                                  border: CustomBorder.enabledBorder,
                                  labelText: "البريد الالكتروني",
                                  focusedBorder: CustomBorder.focusBorder,
                                  errorBorder: CustomBorder.errorBorder,
                                  enabledBorder: CustomBorder.enabledBorder,
                                  labelStyle: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: Colors.black),
                                  floatingLabelBehavior: FloatingLabelBehavior.auto),
                            ),
                            Utils.getSizedBox(height: 20),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                                  border: CustomBorder.enabledBorder,
                                  labelText: "كلمة المرور",
                                  focusedBorder: CustomBorder.focusBorder,
                                  errorBorder: CustomBorder.errorBorder,
                                  enabledBorder: CustomBorder.enabledBorder,
                                  labelStyle: CustomTextStyle.textFormFieldMedium.copyWith(fontSize: MediaQuery.of(context).textScaleFactor * 16, color: Colors.black)),
                              obscureText: true,
                            ),
                            Utils.getSizedBox(height: 20),
                            Text(error, textDirection: TextDirection.rtl, style: const TextStyle(color: Colors.red)),
                            Utils.getSizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  error = '';
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('جاري تسجيل الدخول ...')),
                                    );
                                    auth.login(emailController.text, passwordController.text).then((user) {
                                      if (user != null) {
                                        if (!RouteGenerator.checkIfSameRoute(context, 'account')) {
                                          Navigator.of(context).pushReplacementNamed('account');
                                        }
                                      } else {
                                        error = 'حصل خطأ في تسجيل الدخول تاكد من البريد الالكتروني وكلمة المرور';
                                      }
                                    });
                                  }
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => const HomePage()));
                                },
                                style: getButtonStyle(),
                                child: Text(
                                  "تسجيل الدخول",
                                  style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                            Utils.getSizedBox(height: 10),
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
                            // Utils.getSizedBox(height: 14),
                            // SizedBox(
                            //   width: double.infinity,
                            //   child: ElevatedButton(
                            //       onPressed: () {},
                            //       child: Text(
                            //         "تسجيل باستخدام Facebook",
                            //         style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.white, fontSize: 14),
                            //       ),
                            //       style: getButtonStyle()),
                            // ),
                            Utils.getSizedBox(height: 14),
                            SizedBox(
                                width: double.infinity,
                                child: SignInButton(
                                  Buttons.Google,
                                  text: "تسجيل باستخدام GOOGLE",
                                  onPressed: () {
                                    Provider.of<GoogleSignInController>(context, listen: false).login().then((Object? obj) => {
                                          if (!RouteGenerator.checkIfSameRoute(context, 'account')) {Navigator.of(context).pushReplacementNamed('account')}
                                        });
                                  },
                                )),
                            Utils.getSizedBox(height: 10),
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
                            Utils.getSizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (!RouteGenerator.checkIfSameRoute(context, 'register')) {
                                      Navigator.of(context).pushNamed('register');
                                    }
                                  },
                                  child: Text(
                                    "انشئ حساب جديد",
                                    style: CustomTextStyle.textFormFieldMedium.copyWith(color: Colors.black, fontSize: 14),
                                  ),
                                  style: getInvertButtonStyle()),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                flex: 75,
              )
            ],
          ),
        );
      }),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
