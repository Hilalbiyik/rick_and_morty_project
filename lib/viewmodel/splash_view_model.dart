import 'package:flutter/material.dart';
import 'package:my_api_task/view/main_page.dart';
import 'package:my_api_task/viewmodel/main_view_model.dart';
import 'package:provider/provider.dart';

class SplashViewModel with ChangeNotifier {
  void getSplash(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => MainViewModel(),
            child: MainPage(),
          ),
        ),
      );
    });
  }
}
