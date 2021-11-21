import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/global.dart';

class ThankYouPage extends StatefulWidget {
  const ThankYouPage({Key? key}) : super(key: key);

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
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Column(
          children: <Widget>[
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image(

                  image: NetworkImage("https://us.123rf.com/450wm/vitechek/vitechek1903/vitechek190300310/119777729-vector-folded-hands-icon-on-a-white-background-vector.jpg"),
                  width: 300,
                ),
              ),
              flex: 5,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('orders');
                      },
                      child: const Text(
                        "اعرض تفاصيل الطلب",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: getButtonStyle()
                    )
                  ],
                ),
              ),
              flex: 5,
            )
          ],
        ),
      ),
    );
  }
}