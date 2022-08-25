import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

import 'FirstScreen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  //late AnimationController _lottieAnimation;
  var expanded = false;
  final double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = const Duration(seconds: 1);

  @override
  void initState() {
    //_lottieAnimation = AnimationController(
    //  vsync: this,
    //  duration: const Duration(seconds: 1),
    //);

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => expanded = true))
        .then((value) => const Duration(seconds: 1))
        .then(
          (value) => Future.delayed(const Duration(seconds: 1)).then(
            (value) => //_lottieAnimation.forward().then((value) =>
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()),
                    (route) => false),
          ),
          //),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xFF9ae79a),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: transitionDuration,
              curve: Curves.fastOutSlowIn,
              style: TextStyle(
                color: const Color(0xFF4e954e),
                fontSize: !expanded ? _bigFontSize : 50,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              child: const Text(
                "R",
              ),
            ),
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          "ainyfairy",
          style: TextStyle(
            color: Color(0xFF4e954e),
            fontSize: 50,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: Image(
            image: AssetImage('assets/images/faily.png'),
          ),
        ),
      ],
    );
  }
}
