import 'package:flutter/material.dart';
import 'package:get/get.dart';

/** 아이콘 길이를 받기 위해 bool형식으로 적었음, 기본 크기 55 */

class ImageData extends StatelessWidget {
  String icon;
  final double? width;
  ImageData(
    this.icon, {
    Key? key,
    this.width = 10,
    Color? color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: width! / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class IconsPath {
  static String get killBoong => 'assets/images/img_killboong.png';
  static String get studyBoong => 'assets/images/img_studyboong.png';
  static String get happyBoong => 'assets/images/img_happyboong.png';
}
