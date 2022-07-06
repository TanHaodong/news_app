import 'package:flutter/material.dart';
import 'package:news_app/pages/welcome/welcome.dart';
import 'package:news_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Material App",
      home: const WelcomePage(),
      routes: staticRoutes,
    );
  }
}
