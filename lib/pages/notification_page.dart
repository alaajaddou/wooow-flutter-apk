import 'package:flutter/material.dart';
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
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: getNotifications(),
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: notificationList(snapshot.data),
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
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      notification['title'],
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    IconButton(icon: const Icon(Icons.close), onPressed: () {})
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 6),
                  child: Text(
                    notification['body'],
                    softWrap: true,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              ],
            ),
            flex: 98,
          )
        ],
      ),
    );
  }

  getNotifications() {
    ApiBaseHelper().get('notifications').then((notifications) {
      widget.notifications = notifications;
    });
  }

  List<Widget> notificationList(Object? data) {
    List<Widget> notificationItems = [];
    for (dynamic notification in notificationItems) {
      notificationItems.add(createNotificationListItem(notification));
    }
    return notificationItems;
  }
}
