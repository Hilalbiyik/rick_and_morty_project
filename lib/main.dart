import 'package:flutter/material.dart';
import 'package:my_api_task/view/splash_page.dart';
import 'package:my_api_task/viewmodel/splash_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (BuildContext context) => SplashViewModel(),
          child: SplashPage()),
    );
  }
}
