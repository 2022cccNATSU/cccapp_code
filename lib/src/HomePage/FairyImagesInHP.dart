import 'package:flutter/cupertino.dart';

Widget images(int counter1){
  if(counter1==0){
    return Image.asset('assets/images/smile1.png');
  }else if(counter1==1){
    return Image.asset('assets/images/smile2.png');
  }else if(counter1==2){
    return Image.asset('assets/images/smile3.png');
  }else if(counter1==3){
    return Image.asset('assets/images/smile4.png');
  }else if(counter1==4){
    return Image.asset('assets/images/smile_oops.png');
  }else if(counter1==5){
    return Image.asset('assets/images/oops.png');
  }else if(counter1==6){
    return Image.asset('assets/images/question1.png');
  }else{
    return Image.asset('assets/images/smile1.png');
  }
}