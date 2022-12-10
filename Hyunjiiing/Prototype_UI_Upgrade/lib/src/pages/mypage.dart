import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class myPage extends StatelessWidget {
  const myPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 100,
                    child: Bubble(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      borderColor: Colors.white,
                      borderWidth: 2,
                      margin: BubbleEdges.all(8),
                      nip: BubbleNip.rightBottom,
                      elevation: 0,
                      child: AutoSizeText(
                        '필요한 기능들을 \n건의해주세요!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 180,
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.5,
                height: 300,
                child: Image.asset(
                  "assets/images/img_studyboong.png",
                  width: MediaQuery.of(context).size.width * 0.46,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
