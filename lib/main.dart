import 'package:flutter/material.dart';
import 'package:news_application_ui/modules/active_screen.dart';
import 'package:news_application_ui/modules/active_screen.dart';
import 'package:news_application_ui/modules/discover_screen.dart';

import 'modules/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DiscoverScreen.routeName : (context) => DiscoverScreen(),
        ActiveScreen.routeName : (context) => const ActiveScreen(),
      },
    );
  }
}
