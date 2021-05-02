import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class  Couple extends StatelessWidget {
  var listItem = [
    '好きになったきっかけ',
    '告白のあと、あなたはどう思った？',
    '付き合う前と後では、恋人の印象はどう変わった？',
    '恋人の好きなところ',
    '恋人の許せないところ',
    '恋人は誰に似ている？',
    '付き合った決め手',
    '恋人の顔、体でここが好き！',
    '恋人の性格のここが好き！',
    '愛いな、愛らしいなと思うところ',
    'カッコイイな、素敵だなと 思うところ',
    '嫉妬したこと',
    '直して欲しいところ',
    '愛されていると実感すること',
    '秘密にしていること',
    '実は知っている恋人の秘密',
    '恋人は自分の理想のタイプと比べてどう?',
    '恋人との一番の思い出',
    '恋人にしてもらいたいこと',
    '今後、恋人と一緒にしたいこと',
    '恋人と付き合ってよかったな・・・と思ったこと',
    '付き合いはじめと今とで変わったこと',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "カップル",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              child: Text(listItem[index], style: TextStyle(
                fontSize: 20,
              ),),
              padding: EdgeInsets.all(30.0),),
          );
        },
      ),
    );
  }
}
