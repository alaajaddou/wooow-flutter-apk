import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';
import 'package:wooow_supermarket/utils/global.dart';

class NotificationPage extends StatefulWidget {
  late List<dynamic> notifications = [];
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: FutureBuilder(
        future: getNotifications(),
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData && (snapshot.data as List).isNotEmpty) {
            ApiBaseHelper().put('read-notifications', {});
            return Column(
              children: notificationList(snapshot.data as List<dynamic>),
            );
          } else {
            return const Center(
              child: Text('لايوجد اشعارات'),
            );
          }
        },
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }

  createNotificationListItem(dynamic notification) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      width: double.infinity,
      decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 4,
              margin: const EdgeInsets.only(right: 4),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                color: Colors.green,
              ),
            ),
            flex: 02,
          ),
          Expanded(
            child: ListTile(
              title: Text(notification['title']),
              subtitle: Text(notification['body']),
              horizontalTitleGap: 2.0,
            ),
            flex: 98,
          )
        ],
      ),
    );
  }

  List<Widget> notificationList(List<dynamic> data) {
    List<Widget> notificationItems = [];
    for (dynamic notification in data) {
      notificationItems.add(createNotificationListItem(notification));
    }
    return notificationItems;
  }
}
