import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Bubble(
      padding: const BubbleEdges.all(10.0),
      margin: const BubbleEdges.only(top: 10.0),
      alignment: Alignment.center,
      nip: BubbleNip.leftTop,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontFamily: 'Agne',
        ),
        child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TyperAnimatedText(text),
            ],
            onTap: ((){})
        ),
      ),
    );
  }
}