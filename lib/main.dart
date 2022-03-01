import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';

import 'package:sabzavotlar/Routers/router.dart';
import 'package:sabzavotlar/provider/checkboxprovider.dart';
import 'package:sabzavotlar/screens/forgotPassword.dart';
import 'package:sabzavotlar/screens/SignIn.dart';
import 'package:sabzavotlar/screens/homescreen.dart';
import 'package:sabzavotlar/screens/newregistration.dart';
import 'package:sabzavotlar/screens/phoneNumber.dart';
import 'package:sabzavotlar/screens/resetPassword.dart';
import 'package:sabzavotlar/screens/splashscreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeScreenPage(),
      // initialRoute: "/",
      // onGenerateRoute: MyRouter().onGenerateroute,
    );
  }
}
