import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget icon;
    // if (cart.getCartItemCount() > 0) {
      return ValueListenableBuilder(
          builder: (context, value, child) => Badge(
                badgeColor: Colors.red,
                padding: const EdgeInsets.all(3.0),
                badgeContent: Text(notificationCounter.notificationCounter.toString(), style: const TextStyle(color: Colors.white)),
                showBadge: notificationCounter.notificationCounter > 0,
                child: const Icon(
                  Icons.notifications_active,
                  size: 30,
                ),
              ),
          valueListenable: notificationCounter);
    // } else {
    //   icon = Stack(children: const <Widget>[
    //     Icon(
    //       Icons.notifications_off_outlined,
    //       size: 30,
    //     ),
    //   ]);
    // }
    // return icon;
  }
}

class NotificationCounter extends ValueNotifier<int> {
  int _notificationCounter = 0;

  int get notificationCounter => _notificationCounter;

  set notificationCounter(notificationCounter) {
    _notificationCounter = notificationCounter;
  }

  NotificationCounter(int value) : super(value);

  updateNotificationCounter(value) {
    notificationCounter = value;
    notifyListeners();
  }
}
