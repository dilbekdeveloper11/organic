import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';
import 'package:sabzavotlar/Consts/color.dart';
import 'package:sabzavotlar/Widgets/widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: getW(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: getH(46), left: getW(12)),
              child: Container(
                height: getH(318.11),
                width: getW(349),
                child: Image.asset("assets/images/Dark=false.png"),
              ),
            ),
            SizedBox(height: getH(63.89)),
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colores.lightColor),
            ),
            SizedBox(height: getH(16)),
            SizedBox(
              height: getH(44),
              width: getW(374),
              child: const Text(
                "Welcome to Organico Mobile Apps. Please fill in the field below to sign in.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: getH(32)),
            Widgets.container(
              child: Padding(
                padding: EdgeInsets.only(left: getW(20)),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("assets/images/flag.jpg"),
                    ),
                    SizedBox(width: getW(10)),
                    const Text(
                      "+998",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: getW(11)),
                    Container(
                      height: double.infinity,
                      width: getW(2),
                      color: Color(0xffEAEAEA),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: getH(22), left: getW(20)),
                      child: SizedBox(
                        height: getH(22),
                        width: getW(198),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "Your Phone Number",
                            hintStyle: TextStyle(
                                color: Color(0xff92929D), fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
