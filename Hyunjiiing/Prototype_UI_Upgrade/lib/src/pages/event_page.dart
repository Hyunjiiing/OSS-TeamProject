import 'package:flutter/material.dart';
import 'package:get/get.dart';

class eventPage1 extends GetView<GetxController> {
  const eventPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          'url을 넣어주세요',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
