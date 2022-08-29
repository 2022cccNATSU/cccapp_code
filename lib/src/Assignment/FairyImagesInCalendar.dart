import 'package:flutter/cupertino.dart';

Widget images(int month,int day,int hour) {
  if (month == 1) {
    if (5<=hour&&hour<=9) {
      return  Image.asset('assets/images/oops.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile4.png');
    } else if (hour==21) {
      return Image.asset('assets/images/oops.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return  Image.asset('assets/images/smile3.png');
      } else if (2<=day&&day<=4) {
        return Image.asset('assets/images/smile4.png');
      } else if (day == 7) {
        return Image.asset('assets/images/smile2.png');
      } else if (day == 15) {
        return Image.asset('assets/images/smile3.png');
      } else {
        return Image.asset('assets/images/smile-oops.png');
      }
    }
  } else if (month == 2) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/oops.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile4.png');
    } else if (hour==21) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile1.png');
      } else if (day==3) {
        return Image.asset('assets/images/smile-oops.png');
      } else if (day == 11) {
        return Image.asset('assets/images/smile3.png');
      } else if (day == 14) {
        return Image.asset('assets/images/smile4.png');
      } else {
        return Image.asset('assets/images/oops.png');
      }
    }
  } else if (month == 3) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile3.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile1.png');
    } else if (hour==21) {
      return Image.asset('assets/images/smile1.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile1.png');
      } else if (day==3) {
        return Image.asset('assets/images/smile3.png');
      } else if (day == 14) {
        return Image.asset('assets/images/smile4.png');
      } else if (20<=day) {
        return Image.asset('assets/images/smile2.png');
      } else {
        return Image.asset('assets/images/smile2.png');
      }
    }
  } else if (month == 4) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile4.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile1.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile1.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile2.png');
      } else if (day==10) {
        return Image.asset('assets/images/smile4.png');
      } else {
        return Image.asset('assets/images/smile2.png');
      }
    }
  } else if (month == 5) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile3.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile1.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile2.png');
      } else if (day==4) {
        return Image.asset('assets/images/smile4.png');
      } else if (day==5) {
        return Image.asset('assets/images/smile2.png');
      } else if (day==7) {
        return Image.asset('assets/images/smile3.png');
      } else {
        return Image.asset('assets/images/smile3.png');
      }
    }
  } else if (month == 6) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile1.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile4.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile2.png');
      } else if (2<=day&&day<=10) {
        return Image.asset('assets/images/smile3.png');
      } else if (day==14) {
        return Image.asset('assets/images/smile3.png');
      } else if (day==21) {
        return Image.asset('assets/images/oops.png');
      } else if (25<=day) {
        return Image.asset('assets/images/smile-oops.png');
      } else {
        return Image.asset('assets/images/smile4.png');
      }
    }
  } else if (month == 7) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile1.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile2.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile2.png');
      } else if (day==7) {
        return Image.asset('assets/images/smile4.png');
      } else if (day==14) {
        return Image.asset('assets/images/smile-oops.png');
      } else if (20<=day) {
        return Image.asset('assets/images/oops.png');
      } else {
        return Image.asset('assets/images/smile3.png');
      }
    }
  } else if (month == 8) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile3.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile3.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile4.png');
      } else if (day==11) {
        return Image.asset('assets/images/smile2.png');
      } else if (day==17) {
        return Image.asset('assets/images/smile1.png');
      } else {
        return Image.asset('assets/images/oops.png');
      }
    }
  } else if (month == 9) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile3.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile3.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile1.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/oops.png');
      } else if (day==14) {
        return Image.asset('assets/images/question1.png');
      } else if (day==29) {
        return Image.asset('assets/images/smile4.png');
      } else {
        return Image.asset('assets/images/smile1.png');
      }
    }
  } else if (month == 10) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile4.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile4.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile1.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile2.png');
      } else if (20<=day) {
        return Image.asset('assets/images/smile2.png');
      } else if (day==31) {
        return Image.asset('asset/images/smile4.png');
      } else {
        return Image.asset('assets/images/smile1.png');
      }
    }
  } else if (month == 11) {
    if (5<=hour&&hour<=9) {
      return Image.asset('assets/images/smile2.png');
    } else if (hour==12) {
      return Image.asset('assets/images/smile4.png');
    } else if (19<=hour&&hour<=20) {
      return Image.asset('assets/images/smile3.png');
    } else if (24<=hour&&hour<=4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile2.png');
      } else if (day==15) {
        return Image.asset('assets/images/smile-oops.png');
      } else {
        return Image.asset('assets/images/smile1.png');
      }
    }
  } else if (month == 12) {
    if (5 <= hour && hour <= 9) {
      return Image.asset('assets/images/smile-oops.png');
    } else if (hour == 12) {
      return Image.asset('assets/images/smile4.png');
    } else if (19 <= hour && hour <= 20) {
      return Image.asset('assets/images/smile2.png');
    } else if (24 <= hour && hour <= 4) {
      return Image.asset('assets/images/oops.png');
    } else {
      if (day == 1) {
        return Image.asset('assets/images/smile2.png');
      } else if (day == 20) {
        return Image.asset('assets/images/question1.png');
      } else if (day == 24) {
        return Image.asset('assets/images/smile3.png');
      } else if (day == 25) {
        return Image.asset('assets/images/smile4.png');
      } else if (day == 31) {
        return Image.asset('assets/images/smile4.png');
      } else {
        return Image.asset('assets/images/question1.png');
      }
    }
  }else{
    return Image.asset('assets/images/question1.png');
  }
}