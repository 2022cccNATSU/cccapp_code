import 'package:flutter/material.dart';


const Color TopBarColor = Colors.black54;//上のバーの色
const Color TopBarColorShadow = Colors.black26;//上のバーの影の色
const Color DiamondColor = Colors.indigoAccent;//ダイヤの色
const Color TopBarTextColor = Color(0xFFB0BEC5);//上のバーの数字と設定の色

class TopBar extends StatelessWidget{
  final int point = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Material(
        color: TopBarColor,
        elevation: 24,
        shadowColor: TopBarColorShadow,
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
                    color: DiamondColor,
                    size: 25,
                  ),
                  const SizedBox(width: 30,),
                  Text(
                    '$point',
                    style: const TextStyle(
                      color: TopBarTextColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 180,),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: TopBarTextColor,
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

class FailyImage extends StatelessWidget{
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


class Main_screen extends StatelessWidget{
  const Main_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBar(),
        SizedBox(height: 100,),
        FailyImage(),
      ],
    );
  }

}