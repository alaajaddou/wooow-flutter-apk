import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/global.dart';

class ThankYouPage extends StatefulWidget {
  @override
  _OrderPlacePageState createState() => _OrderPlacePageState();
}

class _OrderPlacePageState extends State<ThankYouPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    image: NetworkImage("https://cdn1.iconfinder.com/data/icons/computer-techologies-outline-part-3/128/ic_thank_you-512.png"),
                    width: 300,
                  ),
                ),
                flex: 5,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: <Widget>[
                      RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: [
                            TextSpan(
                              text:
                              "\n\nشكرا لك على الشراء. تقدر شركتنا كل عميل. نسعى جاهدين لتوفير أحدث الأجهزة التي تستجيب لاحتياجات عملائنا الفردية. إذا كانت لديك أي أسئلة أو تعليقات ، فلا تتردد في التواصل معنا.",
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ])),
                      const SizedBox(
                        height: 24,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: const Text(
                          "اعرض تفاصيل الطلب",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: getPrimaryColor(),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(24))),
                      )
                    ],
                  ),
                ),
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}