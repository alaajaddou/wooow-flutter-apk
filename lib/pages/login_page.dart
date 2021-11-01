import 'package:flutter/material.dart';
import 'package:wooow_supermarket/pages/home_page.dart';
import 'package:wooow_supermarket/pages/register_page.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_border.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/custom_text_style.dart';
import 'package:wooow_supermarket/utils/custom_utils.dart';
import 'package:wooow_supermarket/utils/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const Expanded(
                child: Image(
                    image: AssetImage("assets/images/topbar-icon.png"),
                    height: 100,
                    alignment: Alignment.bottomCenter,
                    width: 200),
                flex: 25,
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
                            labelText: "Mobile No. or Email",
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldMedium
                                .copyWith(
                                fontSize:
                                MediaQuery.of(context).textScaleFactor *
                                    16,
                                color: Colors.black), floatingLabelBehavior: FloatingLabelBehavior.auto),
                      ),
                      Utils.getSizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            border: CustomBorder.enabledBorder,
                            labelText: "Password",
                            focusedBorder: CustomBorder.focusBorder,
                            errorBorder: CustomBorder.errorBorder,
                            enabledBorder: CustomBorder.enabledBorder,
                            labelStyle: CustomTextStyle.textFormFieldMedium
                                .copyWith(
                                fontSize:
                                MediaQuery.of(context).textScaleFactor *
                                    16,
                                color: Colors.black)),
                        obscureText: true,
                      ),
                      Utils.getSizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          style: getButtonStyle(),
                          child: Text(
                            "LOGIN",
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
                      Utils.getSizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "FACEBOOK LOGIN",
                            style: CustomTextStyle.textFormFieldMedium
                                .copyWith(color: Colors.white, fontSize: 14),
                          ),
                          style: getButtonStyle()
                        ),
                      ),
                      Utils.getSizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "GOOGLE LOGIN",
                            style: CustomTextStyle.textFormFieldMedium
                                .copyWith(color: Colors.white, fontSize: 14),
                          ),
                          style: getButtonStyle()
                        ),
                      ),
                      Utils.getSizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: CustomTextStyle.textFormFieldMedium
                                .copyWith(fontSize: 14),
                          ),
                          Utils.getSizedBox(width: 4),
                          GestureDetector(
                            child: Text(
                              "Sign Up",
                              style: CustomTextStyle.textFormFieldBold
                                  .copyWith(fontSize: 14, color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
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