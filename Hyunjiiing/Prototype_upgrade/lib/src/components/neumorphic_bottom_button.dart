import 'package:flutter/material.dart';

class neumorphicButtomButton extends StatefulWidget {
  const neumorphicButtomButton({super.key});

  @override
  State<neumorphicButtomButton> createState() => _neumorphicButtomButtonState();
}

class _neumorphicButtomButtonState extends State<neumorphicButtomButton> {
  int index = 0;
  int current = 0;

  Widget neumorphicBottomButtonDesign() {
    return Container(
      //current : controller.changeBottomNav,
      width: double.infinity,
      height: 50,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.white,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.white,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.white,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: neumorphicBottomButtonDesign(),
    );
  }
}
