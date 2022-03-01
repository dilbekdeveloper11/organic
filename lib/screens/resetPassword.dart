import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';
import 'package:sabzavotlar/Widgets/widgets.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _password3Controller = TextEditingController();
    SizeConfig().init(context);
    return Scaffold(
      appBar: Widgets.appbarim(text: "Reset Password"),
      body: Padding(
        padding: EdgeInsets.only(top: getH(48), left: getW(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getH(44),
              width: getW(374),
              child: Text(
                "Please fill in the field below to reset your current password.",
                style: Widgets.textstyle(),
              ),
            ),
            SizedBox(
              height: getH(48),
            ),
            Text(
              "New Password",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: getH(10)),
            Widgets.container(
              child: Widgets.textFormField(
                hintext: "New Password",
                controller: _password3Controller,
              ),
            ),
            SizedBox(height: getH(16)),
            Text(
              "New Passsword Confirmation",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: getH(10)),
            Widgets.container(
              child: Widgets.textFormField(
                hintext: "New Password Confirmation",
                controller: _password3Controller,
              ),
            ),
            SizedBox(height: getH(45)),
            Widgets.containergreen(text: "Reset password"),
          ],
        ),
      ),
    );
  }
}
