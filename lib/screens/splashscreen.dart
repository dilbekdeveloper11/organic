import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';
import 'package:sabzavotlar/Consts/color.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.pushReplacementNamed(context, "signin");
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: getH(346),
          ),
          child: Column(
            children: [
              Container(
                height: getH(143),
                width: getW(143),
                child: Image.asset("assets/images/Logo.png"),
              ),
              SizedBox(height: getH(24)),
              Text(
                "Organico",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colores.lightColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
