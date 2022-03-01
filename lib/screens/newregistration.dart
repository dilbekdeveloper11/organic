import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';
import 'package:sabzavotlar/Consts/color.dart';
import 'package:sabzavotlar/Widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sabzavotlar/provider/checkboxprovider.dart';

class NewRegistrationPage extends StatelessWidget {
  const NewRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _passWordController = TextEditingController();
   
    SizeConfig().init(context);
    return Scaffold(
      appBar: Widgets.appbarim(text: "New Registration"),
      body: Padding(
        padding: EdgeInsets.only(top: getH(48), left: getW(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "It looks like you don’t have an account on this number. Please let us know some information for a secure service.",
                style: Widgets.textstyle()),
            SizedBox(
              height: getH(48),
            ),
            Text(
              "Full Name",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: getH(10)),
            Widgets.container(
              child: Widgets.textFormField(
                hintext: "Full Name",
                controller: _nameController,
              ),
            ),
            SizedBox(height: getH(16)),
            Text(
              "Password",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: getH(10)),
            Widgets.container(
              child: Widgets.textFormField(
                hintext: "Password",
                controller: _passWordController,
              ),
            ),
            SizedBox(height: getH(16)),
            Text(
              "Password confirmation",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: getH(10)),
            Widgets.container(
              child: Widgets.textFormField(
                hintext: "Password confirmation",
                controller: _passWordController,
              ),
            ),
            SizedBox(height: getH(16)),
            Row(
              children: [
                Checkbox(
                    value: context.watch<CheckBoxProvider>().isChecked,
                    checkColor: Colors.green,
                    focusColor:Colors.green,
                    hoverColor: Colors.green,
                    
                    onChanged: (value) {
                      context.read<CheckBoxProvider>().changedChecked();
                    }),
                const Text(
                  "I accept the",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const Text(
                  " Terms of Use",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
                const Text(
                  " and",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const Text(
                  " Privacy Policy",
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ],
            ),
            SizedBox(height: getH(48)),
            Widgets.containergreen(text: "Sign Up"),
            SizedBox(height: getH(24)),
            const Center(
              child: Text(
                "or use",
                style: TextStyle(fontSize: 16, color: Color(0xff92929D)),
              ),
            ),
            SizedBox(height: getH(24)),
            Container(
              height: getH(52),
              width: getW(374),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.grey)),
              child: const Center(
                child: Text(
                  "Sign Up with Google",
                  style: TextStyle(fontSize: 18, color: Color(0xff171725)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
