import 'package:flutter/material.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(isHome: false),
      body: Column(
        children: const [
          Icon(Icons.manage_search),
          Text('لايوجد نتائج', style: TextStyle(
            color: Colors.grey
          ))
        ],
      ),
      bottomNavigationBar: const CustomNavigator(),
    );
  }
}
