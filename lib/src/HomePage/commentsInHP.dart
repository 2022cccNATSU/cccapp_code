

String comments(int counter1,int counter2) {
  if (counter1 == 0) {
    if (counter2 == 0) {
      return ('今日も一緒に頑張ろうね。');
    } else if (counter2 == 1) {
      return ('今日もお疲れ様。');
    } else if (counter2 == 2) {
      return ('勉強頑張ってね！応援してるよ。');
    } else {
      return ('');
    }
  } else if (counter1 == 1) {
    if (counter2 == 0) {
      return ('疲れたら休むのもアリだよ。健康第一だからね。');
    } else if (counter2 == 1) {
      return ('暗記物は寝る直前にやると頭に定着しやすいんだって。暗記が必要な時は試してみてね。');
    } else if (counter2 == 2) {
      return ('わからない問題は答えを見てぜんぜんオッケーだよ。あ、でも解説はちゃんと見てね！自分だけで長い間悩むより、解き方を覚えっちゃった方が早いもんね');
    } else {
      return ('');
    }
  } else if (counter1 == 2) {
    if (counter2 == 0) {
      return ('私は休み時間にお菓子を食べてリフレッシュするの♪きのこの山もたけのこの里も、両方好きだよ');
    } else if (counter2 == 1) {
      return ('解けなかった問題が解けるようになると楽しいね♪');
    } else if (counter2 == 2) {
      return ('遠い大学にいっちゃったけど、昔はお姉さまが勉強を教えてくれたの。私も頑張らないと。');
    } else
      return ('');
  } else if (counter1 == 3) {
    if (counter2 == 0) {
      return ('ふふっ、勉強頑張ったからテストの点数良かったんだ♪お母様もほめてくれるかな。');
    } else if (counter2 == 1) {
      return ('ふふっ、勉強頑張ったからテストの点数良かったんだ♪お父様もほめてくれるかな。');
    } else if (counter2 == 2) {
      return ('やっぱり、休憩時間にはハチミツ牛乳だね！甘くて、まろやかで、お気に入りなの♪');
    } else
      return ('');
  } else if (counter1 == 4) {
    if (counter2 == 0) {
      return ('勉強って勢いついちゃうと、意識して休憩を取るのが難しくなっちゃうよね');
    } else if (counter2 == 1) {
      return ('あはは．．．消しゴムなくしたと思って新しいのを買ったのに、筆箱の奥に入ってた．．．');
    } else if (counter2 == 2) {
      return ('課題の提出日はちゃんとチェックしないとね、本当に．．．');
    } else
      return ('');
  } else if (counter1 == 5) {
    if (counter2 == 0) {
      return ('むむむ、この問題全く分からない．．．あとで解説見ないと');
    } else if (counter2 == 1) {
      return ('あれれ、こんな問題あったっけ？．．．問題１個飛ばしちゃってる．．．');
    } else if (counter2 == 2) {
      return ('落とした消しゴム、いったいどこに消えたんだろう．．．');
    } else
      return ('');
  } else if (counter1 == 6) {
    if (counter2 == 0) {
      return ('なんかあったような気がするけど．．．まぁいっか♪');
    } else if (counter2 == 1) {
      return ('今日は何か課題出た？しっかりメモして覚えておこうね');
    } else if (counter2 == 2) {
      return ('調子はどうかな？今日はどれくらい勉強するの？');
    } else {
      return ('');
    }
  } else {
    return ('');
  }
}