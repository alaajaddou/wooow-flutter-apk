import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/pages/about_page.dart';
import 'package:wooow_supermarket/pages/edit_profile_page.dart';
import 'package:wooow_supermarket/pages/invite_friends_page.dart';
import 'package:wooow_supermarket/pages/notification_page.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ListProfileSection> listSection = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createListItem();
  }

  void createListItem() {
    listSection.add(createSection("Notifications", "https://w7.pngwing.com/pngs/257/702/png-transparent-about-us-logo-business-logo-company-brand-service-icon-about-us-hd-miscellaneous-blue-text.png", Colors.blue.shade800, const NotificationPage()));
    // listSection.add(createSection(
    //     "Payment Method", "images/ic_payment.png", Colors.teal.shade800, null));
    listSection.add(createSection("Settings", "https://w7.pngwing.com/pngs/257/702/png-transparent-about-us-logo-business-logo-company-brand-service-icon-about-us-hd-miscellaneous-blue-text.png", Colors.red.shade800, const EditProfilePage()));
    listSection.add(createSection("Invite Friends", "https://w7.pngwing.com/pngs/257/702/png-transparent-about-us-logo-business-logo-company-brand-service-icon-about-us-hd-miscellaneous-blue-text.png", Colors.indigo.shade800, const InviteFriendsPage()));
    listSection.add(createSection("About Us", "https://w7.pngwing.com/pngs/257/702/png-transparent-about-us-logo-business-logo-company-brand-service-icon-about-us-hd-miscellaneous-blue-text.png", Colors.black.withOpacity(0.8), const AboutPage()));
    // listSection.add(createSection(
    //     "Logout", "images/ic_logout.png", Colors.red.withOpacity(0.7), null));
  }

  createSection(String title, String icon, Color color, Widget widget) {
    return ListProfileSection(title, icon, color, widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 24),
          FutureBuilder<Widget>(
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                  return snapshot.data as Widget;
                } else {
                  return const CircularProgressIndicator();
                }
              },
              future: buildHeader()),
          const SizedBox(height: 24),
          buildListView()
        ],
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  Future<Widget>? buildHeader() async {
    var user = await auth.getUser();

    return Container(
      margin: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(color: getPrimaryColor()),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            height: 60,
            decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_1280.png")), borderRadius: BorderRadius.all(Radius.circular(24))),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user!.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.blue.shade900, fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.email,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            flex: 100,
          )
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return createListViewItem(listSection[index]);
      },
      itemCount: listSection.length,
    );
  }

  createListViewItem(ListProfileSection listSection) {
    return Builder(builder: (context) {
      return InkWell(
        splashColor: Colors.teal.shade200,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => listSection.widget));
        },
        child: Container(
          padding: const EdgeInsets.only(top: 14, left: 24, right: 8, bottom: 14),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(24)), color: listSection.color),
                  child: Image(
                    image: NetworkImage(listSection.icon),
                    color: Colors.white,
                  ),
                ),
                flex: 8,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    listSection.title,
                  ),
                ),
                flex: 84,
              ),
              const Expanded(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
                flex: 8,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ListProfileSection {
  String title;
  String icon;
  Color color;
  Widget widget;

  ListProfileSection(this.title, this.icon, this.color, this.widget);
}
