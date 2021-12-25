import 'package:flutter/material.dart';
import 'package:wooow_supermarket/main.dart';
import 'package:wooow_supermarket/utils/global.dart';
import 'package:wooow_supermarket/utils/route_generator.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({Key? key}) : super(key: key);

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  void _onItemTapped(int index) async {
    if (index == selectedIndex) {
      return;
    }
    setState(() {
      selectedIndex = index;
    });
    String page = await getPageFromIndex(index);
    if (!RouteGenerator.checkIfSameRoute(context, page)) {
      Navigator.of(context).pushNamed(page);
    }
    // Navigator.of(context).pushNamed(page);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: getPrimaryColor(), primaryColor: Colors.white, textTheme: Theme.of(context).textTheme.copyWith(caption: const TextStyle(color: Colors.grey))),
        child: BottomNavigationBar(
          backgroundColor: getPrimaryColor(),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'التصنيفات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_rounded),
              label: 'الطلبيات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'الحساب',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ));
  }

  Future<String> getPageFromIndex(index) async {
    switch (index) {
      case 1:
        return 'categories';
      case 2:
        if (auth.isAuthenticated) {
          return 'orders';
        } else {
          return 'login';
        }
      case 3:
        if (auth.isAuthenticated) {
          return 'account';
        } else {
          return 'login';
        }
      case 0:
      default:
        return '';
    }
  }
}
