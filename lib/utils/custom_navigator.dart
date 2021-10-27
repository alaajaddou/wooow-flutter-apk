import 'package:flutter/material.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({Key? key}) : super(key: key);

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.lightGreen.shade300, primaryColor: Colors.white, textTheme: Theme.of(context).textTheme.copyWith(caption: const TextStyle(color: Colors.grey))),
        child: BottomNavigationBar(
          backgroundColor: Colors.lightGreen.shade300,
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
