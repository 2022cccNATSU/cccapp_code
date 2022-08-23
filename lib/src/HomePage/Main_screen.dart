import 'package:flutter/material.dart';

import '../../widget/Constants.dart';

class TopBar extends StatelessWidget {
  final int point = 0;

  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Material(
        color: topBarColor,
        elevation: 24,
        shadowColor: topBarColorShadow,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 30,
            bottom: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.diamond,
                    color: diamondColor,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '$point',
                    style: const TextStyle(
                      color: topBarTextColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: topBarTextColor,
                      size: 25,
                    ),
                    onPressed: () {
                      //処理
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FailyImage extends StatelessWidget {
  final String image = 'assets/images/faily.png';

  const FailyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 30,
        bottom: 15,
      ),
      child: Image.asset(image),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/BackGround.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: const <Widget>[
          TopBar(),
          SizedBox(height: 100),
          FailyImage(),
        ],
      ),
    );
  }
}
