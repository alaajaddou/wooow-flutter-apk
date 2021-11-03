import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:wooow_supermarket/utils/global.dart';

class InviteFriendsPage extends StatefulWidget {
  const InviteFriendsPage({Key? key}) : super(key: key);

  @override
  _InviteFriendsPageState createState() => _InviteFriendsPageState();
}

class _InviteFriendsPageState extends State<InviteFriendsPage> {
  static const platform = MethodChannel('flutter.native/helper');
  String shareResponse = "Sharing";

  Future<String> shareApp() async {
    String response = "";
    try {
      String result = await platform.invokeMethod("shareApp");

      response = result;
    } on PlatformException {
      response = "Failed "
          "to shared app";
    }
    setState(() {
      shareResponse = response;
    });
    return shareResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Invite Friends",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Builder(
        builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[createHeader(), createMiddle()],
                ),
                flex: 90,
              ),
              createFooter(context)
            ],
          );
        },
      ),
    );
  }

  Expanded createFooter(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
              child: ElevatedButton(
                onPressed: () {
                  shareApp();
                },
                style: getButtonStyle(),
                child: const Text(
                  "Share Link",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            flex: 85,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 4, bottom: 8, top: 6),
              child: ElevatedButton(
                onPressed: () {},
                child: const Image(
                  image: AssetImage("images/ic_qr_code.png"),
                  color: Colors.white,
                ),
                style: getButtonStyle()
              ),
            ),
            flex: 15,
          )
        ],
      ),
      flex: 10,
    );
  }

  createHeader() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 160,
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/ic_refer_friends_bg.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: const Text(
                "Invite Friends & Earn Points",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "When you invite friends to join Carter, you can 100 points to each friends.Whenever your friends consume through Carter, you will get a 5% bonus",
                style: TextStyle(color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  createMiddle() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "My Invitation",
                  style: TextStyle( fontWeight: FontWeight.bold,
                      fontSize: 14, color: Colors.black.withOpacity(0.9)),
                ),
                const Text(
                  "Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            height: 1,
            width: double.infinity,
          ),
          SizedBox(
            height: 60,
            child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return gridItem();
              },
              itemCount: 2,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }

  gridItem() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 8,
      ),
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(width: 8),
          const Icon(
            Icons.menu,
            color: Colors.blue,
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "0.34123205",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(width: 4),
              Text(
                "Today Reward",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}