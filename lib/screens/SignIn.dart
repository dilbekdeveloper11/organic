import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';
import 'package:sabzavotlar/Consts/color.dart';
import 'package:sabzavotlar/Widgets/widgets.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final _firebaseInit = Firebase.initializeApp();
  TextEditingController _phoneController = TextEditingController();
  final FirebaseAuth _authUser = FirebaseAuth.instance;
  TextEditingController _passwordContoller = TextEditingController();
  String smsCode = "";
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Widgets.Paddingim(
          top: 10,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: getH(56), left: getW(12)),
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
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
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
              SizedBox(height: getH(7)),
              Widgets.container(
                child: Padding(
                  padding: EdgeInsets.only(left: getW(20)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: getH(22)),
                          child: Widgets.textFormField(
                              hintext: "Password",
                              controller: _passwordContoller)),
                      SizedBox(width: getW(90)),
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getH(41), left: getW(241)),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 16, color: Color(0xff2ECC71)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: getH(44)),
                child: InkWell(
                  child: Widgets.containergreen(text: "Sign In"),
                  onTap: () {
                    verifySms();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future verifySms() async {
    await _authUser.verifyPhoneNumber(
        phoneNumber: "+998${_phoneController.text}",
        verificationCompleted: (v) {
          print("Verification Completed");
        },
        verificationFailed: (v) {
          debugPrint("Verification failed: ${v}");
        },
        codeSent: (verificationId, resendToken) async {
          debugPrint("Code is Sent");
          PhoneAuthCredential _phoneCredential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          await _authUser.signInWithCredential(_phoneCredential).then((value) {
            print("Lucky");
          });
        },
        codeAutoRetrievalTimeout: (verificationId) {});
  }
}
