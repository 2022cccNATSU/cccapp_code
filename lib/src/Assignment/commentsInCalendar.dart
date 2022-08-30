

String comments(int month,int day,int hour) {

  if (month == 1) {
      if (5<=hour&&hour<=9) return ('眠い！寒い！布団から出たくない～！');
      else if (hour==12) return('きれいな雪．．．冬なのにかき氷食べたくなって来ちゃった');
      else if (19<=hour&&hour<=20) return ('こたつ～、心の友よ～');
      else if (hour==21) return ('げっ！！ストーブの灯油が切れた．．．');
      else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
      else {
        if (day == 1)
          return ('明けましておめでとう。今年もよろしくね！');
        else if (2<=day&&day<=4)
          return ('初詣はもう行った？しっかりお参りしないとね♪その後は、じゃがバターにたこ焼き、綿あめにりんご飴!');
        else if (day == 7)
          return ('七草粥はもう食べた？今年まるまる一年、お互い健康に過ごせますように。');
        else if (day == 15)
          return ('この前、鏡開きしたんだ。お餅おいしかったなぁ。');
        else return ('う～寒いなぁ、早くあったかくなんないかな～');
      }
  } else if (month == 2) {
    if (5<=hour&&hour<=9) return ('まだ寒いなぁ、1日中布団にくるまっていたい．．．');
    else if (hour==12) return('まだまだ冬だね～');
    else if (19<=hour&&hour<=20) return ('こたつよ、私にはまだまだ君の力が必要なようだ');
    else if (hour==21) return ('う～ん、寒いとついつい長風呂しちゃう．．．');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう一ヶ月、これからも頑張っていこう！');
      else if (day==3)
        return ('福はうち～鬼はそと～、勉強はうち～ゲームはそと～．．．やっぱりゲームもうちで．．．');
      else if (day == 11)
        return ('今日は建国記念日！でもいつ建国したかわからないから、建国した日じゃなくて建国を記念する日なんだって。');
      else if (day == 14)
        return ('今日はバレンタインデーだね～、私のチョコは私のもの、君のチョコも私のものだよ♪');
      else return ('暖かくなれ～、暖かくなれ～、ムムム．．．');
    }
  } else if (month == 3) {
    if (5<=hour&&hour<=9) return ('ちょっと暖かくなってきたかな？だがしかし布団からは逃れられない！');
    else if (hour==12) return('昼になるとけっこう暖かくなるね');
    else if (19<=hour&&hour<=20) return ('こたつとの別れの日も近い．．．');
    else if (hour==21) return ('ストーブお疲れ様、冬にまたよろしくね。');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう二ヶ月、これからも頑張っていこう！');
      else if (day==3)
        return ('今日はひな祭り！小さい頃は家族みんなで飾りつけしたっけ。懐かしいなぁ。');
      else if (day == 14)
        return ('今日はホワイトデー！バレンタインデーにくれたお礼にまたもらってあげるね♪');
      else if (20<=day)
        return ('梅の花がきれいだね～、桜もそろそろかな？梅も好きだけど桜餅も捨てがたいね。');
      else return ('あともうちょっと暖かくなったら過ごしやすそう！');
    }
  } else if (month == 4) {
    if (5<=hour&&hour<=9) return ('あったかくて気持ちいい日が多くて助かるね♪、じゃあおやすみ');
    else if (hour==12) return('きれいな桜だね、すぐに散っちゃうから目に焼き付けとかないと。');
    else if (19<=hour&&hour<=20) return ('こたつよ、心の友よ．．．冬にまた会おう。');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう三ヶ月、今年度も頑張っていこう！');
      else if (day==10)
        return ('この前、お花見をしたの！きれいだったなぁ。お菓子もおいしかったなぁ。');
      else return ('暖かくて過ごしやすいね、でもあの重い布団がちょっと恋しいな');
    }
  } else if (month == 5) {
    if (5<=hour&&hour<=9) return ('まだちょうどいい気温だね、2度寝したくなるほどに．．．');
    else if (hour==12) return('木々のみどりも鮮やかになってきたね');
    else if (19<=hour&&hour<=20) return ('そろそろ扇風機だそうかな');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう四ヶ月、この調子で頑張っていこう！');
      else if (day==4)
        return ('今日はゴールデンウィークのみどりの日、つまり私の日！');
      else if (day==5)
        return ('鯉のぼりに乗って空を飛べたらいいのにな～。君には翼はないけどそれなら一緒に飛べるもんね。');
      else if (day==7)
        return ('今月の第２日曜日は母の日だよ。プレゼント、喜んでくれるかな♪');
      else return ('ちょっと暑くなってきたね、でもまだ過ごしやすくていいね');
    }
  } else if (month == 6) {
    if (5<=hour&&hour<=9) return ('おはよう。ちょっと暑いね～、昼にはもっと暑くなりそう');
    else if (hour==12) return('もう梅雨だね～、雨は嫌いじゃないけど、こんなに多いと流石にね．．．');
    else if (19<=hour&&hour<=20) return ('扇風機、スイッチON！');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう五ヶ月、この調子で頑張っていこう！');
      else if (2<=day&&day<=10)
        return ('梅干しに梅ジュースに梅ジャム！');
      else if (day==14)
        return ('今月の第３日曜日は父の日だよ。プレゼント、喜んでくれるかな♪');
      else if (day==21)
        return ('もう夏至だって。ここからもっと暑くなるなんて．．．');
      else if (25<=day)
        return ('梅雨明けしてから一気に熱くなったね');
      else return ('６月の花といえばアジサイだよね。近所にも咲いてるけどほんとにきれいだよね');
    }
  } else if (month == 7) {
    if (5<=hour&&hour<=9) return ('暑い～、そろそろクーラーつけようかな～');
    else if (hour==12) return('植物も空も色鮮やかで、いかにも夏って感じだね');
    else if (19<=hour&&hour<=20) return ('扇風機涼しい～、ワレワレハウチュウジンダ～');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう六ヶ月、もうすぐで夏休み！');
      else if (day==7)
        return ('今日は七夕だね。何をお願いした？私はね～．．．やっぱりヒミツ！');
      else if (day==14)
        return ('今月の第３月曜日は海の日だよ。去年海に行ったときは、はしゃぎすぎて翼が砂まみれになっちゃったっけ。');
      else if (20<=day)
        return ('最近ウナギの数が減ってるって聞くけど、いつかは食べられなくなっちゃうのかな。おいしいのに．．．');
      else return ('暑いね～、でもそのおかげでアイスがおいしい！');
    }
  } else if (month == 8) {
    if (5<=hour&&hour<=9) return ('クーラーのリモコン～、ポチっとな！おやすみ！');
    else if (hour==12) return('ホントに\nクーラーさまさまだね～');
    else if (19<=hour&&hour<=20) return ('クーラーと扇風機とアイスの完璧な布陣！');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、夏休みだからって気持ちもわかるけど、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう七ヶ月、夏休みサイコー！');
      else if (day==11)
        return ('今日は山の日なんだって！でも山は紅葉が見ごろになって涼しくなってから行きたいね～');
      else if (day==17)
        return ('お盆はどうだった？私のご先祖様ってどんな人だったんだろう。');
      else return ('暑い～もう毎日プール行きたいよ～');
    }
  }else if (month == 9) {
    if (5<=hour&&hour<=9) return ('まだちょっと暑いかな。でも二度寝はしやすいね。おやすみ！');
    else if (hour==12) return('そろそろ秋の味覚を堪能できる時期に．．．');
    else if (19<=hour&&hour<=20) return ('そろそろ扇風機もしまい時かも。');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう八ヶ月、ついに夏休みが終わってしまう．．．');
      else if (day==14)
        return ('今月の第３月曜日は敬老の日だよ。君の祖父母さんってどんな人なの？');
      else if (day==29)
        return ('今日は招き猫の日だって！かわいいよね！勉強机に置いとこうかな。');
      else return ('暑さは段々落ち着いてきたかな。過ごしやすくなってきたね。');
    }
  }else if (month == 10) {
    if (5<=hour&&hour<=9) return ('涼しくなってきたね。二度寝、じゃなくて過ごしやすくていい感じ！');
    else if (hour==12) return('さっつまいも♪さっつまいも♪焼き芋に芋タルトにスイートポテト！');
    else if (19<=hour&&hour<=20) return ('さらば扇風機！私は君を忘れない！');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう九ヶ月、この調子で頑張っていこう！');
      else if (20<=day)
        return ('段々と紅葉が広がってきた効用で私も高揚してきた！．．．うん．．．');
      else if (day==31)
        return ('今日はハロウィン！毎日妖精のコスプレしてるからお菓子一年分ちょうだい♪トリートオアトリート！');
      else return ('ちょっと暑くなってきたね、でもまだ過ごしやすくていいね');
    }
  }else if (month == 11) {
    if (5<=hour&&hour<=9) return ('ちょっと寒くなってきたね。でもまだイケる！');
    else if (hour==12) return('段々落ち葉も増えてきたね。集めて焼き芋したいなぁ。');
    else if (19<=hour&&hour<=20) return ('充電中のスマホがあったかい～');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年も始まってもう十ヶ月、この調子で頑張っていこう！');
      else if (day==15)
        return ('今日は七五三だね。あの頃の写真、人のは見たいけど自分のはあんまり見せたくないな～');
      else return ('ちょっと寒いね。そろそろストーブが必要かな。');
    }
  }else if (month == 12) {
    if (5<=hour&&hour<=9) return ('結構寒いね～。朝はストーブが欲しいな～');
    else if (hour==12) return('寒いね～。そんな昼にはホットココア！');
    else if (19<=hour&&hour<=20) return ('ストーブセット！ファイアー！');
    else if (24<=hour||hour<=4) return ('もう寝ようよ、明日に響いちゃうよ～');
    else {
      if (day == 1)
        return ('今年ももうラスト一ヶ月、最後まで一緒に頑張ろう！');
      else if (day==20)
        return ('そろそろ冬至の日だね。お風呂に浮かんでる柚は食べちゃダメなんだって、知ってた？');
      else if (day==24)
        return ('明日はクリスマス！サンタさんって生ものもプレゼントしてくれるかな？');
      else if (day==25)
        return ('今日はクリスマス！サンタさん本当にタラバガニをプレゼントしてくれた！');
      else if (day==31)
        return ('今日は大晦日！今年一年間お疲れ様！今日は思いっきり休むのもありかもね。');
      else return ('冬だね～、この冬はどれくらい雪降るんだろ。');
    }
  }else {
    return ('あれ、今日って何曜日だっけ？');
  }
}