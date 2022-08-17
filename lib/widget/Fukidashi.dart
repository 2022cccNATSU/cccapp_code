import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class CustomText extends StatefulWidget {
  final String text;

  CustomText({required this.text});

  @override
  _CustomText createState() => _CustomText();
}

class _CustomText extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Bubble(
      padding: BubbleEdges.all(10.0),
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
              TyperAnimatedText(widget.text),
            ],
            onTap: ((){})
        ),
      ),
    );
  }
}