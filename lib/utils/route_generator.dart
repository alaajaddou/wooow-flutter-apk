import 'package:flutter/material.dart';
import 'package:wooow_supermarket/pages/about_page.dart';
import 'package:wooow_supermarket/pages/home_page.dart';
import 'package:wooow_supermarket/utils/custom_appbar.dart';
import 'package:wooow_supermarket/utils/custom_navigator.dart';

class RouteGenerator {
  static var currentRoute;
  static Route<dynamic> generateRoute(RouteSettings settings) {
      final arguments = settings.arguments;
      currentRoute = settings.name;
      switch (settings.name) {
        case '':
          return MaterialPageRoute(builder: (_) => const HomePage());
        case 'about':
          return MaterialPageRoute(builder: (_) => const AboutPage());
        default:
          return MaterialPageRoute(builder: (_) => const ErrorPage());
      }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
          child: Text('Error')
      ),
      bottomNavigationBar: CustomNavigator(),
    );
  }
}
