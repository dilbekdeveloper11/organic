import 'package:flutter/material.dart';
import 'package:sabzavotlar/Consts/SizeConfig.dart';

class Widgets {
  static Container container({required child}) {
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
}
