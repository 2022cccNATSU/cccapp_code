import 'dart:math' as math;
import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];

class ColorDetail {
  static Color returnColor(String color) {
    switch(color) {
      case 'red':
        return colors[0];
      case 'pink':
        return colors[1];
      case 'purple':
        return colors[2];
      case 'deepPurple':
        return colors[3];
      case 'indigo':
        return colors[4];
      case 'blue':
        return colors[5];
      case 'lightBlue':
        return colors[6];
      case 'cyan':
        return colors[7];
      case 'teal':
        return colors[8];
      case 'green':
        return colors[9];
      case 'lightGreen':
        return colors[10];
      case 'lime':
        return colors[11];
      case 'yellow':
        return colors[12];
      case 'amber':
        return colors[13];
      case 'orange':
        return colors[14];
      case 'deepOrange':
        return colors[15];
      case 'brown':
        return colors[16];
      case 'grey':
        return colors[17];
      case 'blueGrey':
        return colors[18];
      case 'black':
        return colors[19];
      default:
        return Colors.white;
    }
  }
  static Color randomColor() {
    var rand = math.Random();
    return colors[rand.nextInt(20)];
  }
}