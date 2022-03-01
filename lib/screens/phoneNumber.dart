import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';
import 'package:sabzavotlar/Widgets/widgets.dart';

import '../Consts/color.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _codeController = TextEditingController();
    SizeConfig().init(context);
    return Scaffold(
      appBar: Widgets.appbarim(text: "OTAC Number"),
      body: Padding(
        padding: EdgeInsets.only(
          top: getH(48),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                "Enter Authorization Code",
                style: TextStyle(
                    fontSize: 20,
                    color: Colores.lightColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: getH(16)),
            Center(
              child: Text(
                "We have sent SMS to",
                style: Widgets.textstyle(),
              ),
            ),
            const Center(
              child: Text(
                "+99893783985",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(height: getH(15)),
            Widgets.container(
              child: Widgets.textFormField(
                hintext: "6 Digit Code",
                controller: _codeController,
              ),
            ),
             Padding(
              padding:  EdgeInsets.only(top: getH(24),left: getW(250)),
              child: const Text(
                "Resend Code",
                style: TextStyle(fontSize: 16, color: Color(0xff2ECC71)),
              ),
            ),
            SizedBox(height: getH(56)),
            Widgets.containergreen(text: "Next")
          ],
        ),
      ),
    );
  }
}
