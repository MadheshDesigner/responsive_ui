import 'package:flutter/material.dart';
import 'package:responsive_ui/view/base/theme_data.dart';
import 'package:responsive_ui/view/screen/bottom_navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     theme: lightData,
     home:  BottomNavigationBarScreen(pageIndex: 0),
    );
  }
}
