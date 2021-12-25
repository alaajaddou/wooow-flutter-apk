import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/models/GoogleSignInController.dart';
import 'package:wooow_supermarket/pages/about_page.dart';
import 'package:wooow_supermarket/pages/addresses_page.dart';
import 'package:wooow_supermarket/pages/edit_profile_page.dart';
import 'package:wooow_supermarket/pages/notification_page.dart';
import 'package:wooow_supermarket/pages/order_list.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ListProfileSection> listSection = [];

  @override
  void initState() {
    super.initState();
    createListItem();
  }

  void createListItem() {
    // listSection.add(createSection("الإعدادات", const Icon(Icons.settings, color: Colors.white), Colors.red.shade800, EditProfilePage()));
    listSection.add(createSection("العناوين", const Icon(Icons.location_pin, color: Colors.white), Colors.amber.shade400, AddressesPage(fromCheckout: false,)));
    listSection.add(createSection("الإشعارات", const Icon(Icons.notifications_active, color: Colors.white), Colors.blue.shade800, NotificationPage()));
    listSection.add(createSection("الطلبيات", const Icon(Icons.file_copy_rounded, color: Colors.white), Colors.teal.shade800, const OrderList()));
    listSection.add(createSection("معلومات", const Icon(Icons.info, color: Colors.white), Colors.lightBlue, const AboutPage()));
  }

  createSection(String title, Widget icon, Color color, Widget widget) {
    return ListProfileSection(title, icon, color, widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 24),
          FutureBuilder<Widget>(
              initialData: headerPlaceHolder(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                  return snapshot.data as Widget;
                }
                return headerPlaceHolder();
              },
              future: buildHeader()),
          const SizedBox(height: 24),
          buildListView()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoogleSignInController().logout();
          print(auth.user.loginProvider);
          auth.logout().then((response) {
            print('response');
            print(response);
            if (!RouteGenerator.checkIfSameRoute(context, '')) {
              Navigator.of(context).pushNamed('');
              selectedIndex = 0;
            }
          });
          // if(auth.user.loginProvider == 'google') {
          // }
        },
        child: const Icon(
          Icons.logout,
          color: Colors.white,
          size: 35.0,
        ),
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  Widget headerPlaceHolder() {
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: getPrimaryColor()),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            height: 60,
            decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_1280.png")),
                borderRadius: BorderRadius.all(Radius.circular(24))),
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
                      '',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.blue.shade900, fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            flex: 100,
          )
        ],
      ),
    );
  }

  Future<Widget> buildHeader() async {
    return Container(
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: getPrimaryColor()),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            height: 60,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(getImagePath(auth.user.imagePath))), borderRadius: const BorderRadius.all(Radius.circular(24))),
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
                      auth.user.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.blue.shade900, fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      auth.user.email,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
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
                  child: listSection.icon,
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

  getImagePath(imagePath) {
    if (imagePath.contains('http')) {
      return imagePath;
    } else {
      return Global.storagePath + imagePath;
    }
  }
}

class ListProfileSection {
  String title;
  Widget icon;
  Color color;
  Widget widget;

  ListProfileSection(this.title, this.icon, this.color, this.widget);
}

class Logout {
  Logout(context) {
    Navigator.pushNamed(context, '');
  }
}
