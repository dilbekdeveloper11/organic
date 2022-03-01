import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';
import 'package:sabzavotlar/Widgets/widgets.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneController2 = TextEditingController();
    SizeConfig().init(context);
    return Scaffold(
      appBar: Widgets.appbarim(text: "Forgot Password"),
      body: Padding(
        padding: EdgeInsets.only(top: getH(28), left: getW(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 12),
              height: getH(345.7),
              width: getW(315.64),
              child: Image.asset("assets/images/Dark=falsepasword.png"),
            ),
            SizedBox(height: getH(70.25)),
            const Text(
              "Enter your phone number",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            SizedBox(height: getH(16)),
            SizedBox(
              height: getH(44),
              width: getW(374),
              child: Text(
                "We need to verify you. We will send you a one-time authorization code.",
                style: Widgets.textstyle(),
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
                          controller: _phoneController2,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: "Your Phone Number",
                            hintStyle: TextStyle(
                                color: Color(0xff92929D), fontSize: 16),
                          ),
                          validator: (v) {
                            if (v!.length < 9) {
                              return "Iltimos raqamni togri kiriting";
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: getH(79)),
            Widgets.containergreen(text: "Next")
          ],
        ),
      ),
    );
  }
}
