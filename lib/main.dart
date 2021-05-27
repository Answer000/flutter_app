import 'package:flutter/material.dart';
import 'package:flutter_app/class/home/home.dart';
import 'package:flutter_app/class/profile/signIn/signIn.dart';
import 'package:flutter_app/common/base/tabbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
          title: "超级美",
          initialRoute: 'root',
          routes: {
            'root' : (context) => ASTabBar(),
            'chaojimei_signin' : (context) => SignIn(),
          },
          home: ASTabBar(),
      )
  );
}