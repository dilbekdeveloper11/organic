import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';
import 'package:sabzavotlar/Consts/color.dart';

class Widgets {
  static Container container({
    required child,
  }) {
    return Container(
      height: getH(44),
      width: getW(374),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEAEAEA),
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: child,
    );
  }

  static Padding Paddingim({
    required child,
    double top = 0,
    double left = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: getH(top),
        left: getW(left),
        right: getW(right),
        bottom: getH(bottom),
      ),
      child: child,
    );
  }

  static containergreen({
    required String text,
  }) {
    return Container(
      height: getH(52),
      width: getW(374),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Color(0xff2ECC71)),
      child: Center(
        child: Text(
          "$text",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  static textFormField({required String hintext, required dynamic controller}) {
    return SizedBox(
      height: getH(22),
      width: getW(220),
      child: Padding(
        padding: EdgeInsets.only(top: getH(20)),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            hintText: hintext,
            hintStyle: TextStyle(color: Color(0xff92929D), fontSize: 16),
          ),
          validator: (v) {
            if (v!.length == 0) {
              return "Iltimos sizga jo'natilgan parolni kiriting";
            }
          },
        ),
      ),
    );
  }

  static AppBar appbarim({required String? text}) {
    return AppBar(
     
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: EdgeInsets.only(top: getH(20.5), left: getW(20)),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(top: getH(20.5)),
        child: Text(
          text.toString(),
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  static textstyle() {
    return TextStyle(fontSize: 16, color: Colores.greycolor);
  }
}
