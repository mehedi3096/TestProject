import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:mahatab_app/screens/getPhotoList.dart';
import 'package:mahatab_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext buildContext) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.purple,
      ),
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/testapi', page: () => GetPhotoList()),
      ],
    );
  }
}
