import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class  Experience extends StatelessWidget {
  var listItem = [
    '私が見た不思議な夢',
    '私がお酒でやらかした失敗談',
    '私が街で出会った有名人',
    '恥ずかしかった話',
    'ゾッとした話',
    '今までで一番ツイていた出来事',
    'ツイていないなと感じた出来事',
    '今だから言える私の黒歴史',
    'ちょっと不思議な体験',
    '人生で一番努力したこと',
    '三日坊主で終わったこと',
    '今も記憶に残る衝撃的な夢',
    '今まで一番衝撃的だった出来事',
    '我ながら昔の自分に感心してしまうこと',
    '私が目撃した珍事件',
    '私が一番緊張した場面',
    '私が経験したちょっと怖い話',
    '今までで一番贅沢した体験',
    '最近チャレンジしてみたこと',
    '私が思わず泣いてしまった瞬間',
    '〇〇に初挑戦したときの話',
    '「もう二度と〇〇しない！」と思ったこと',
    '私の鉄板のすべらない話',
    '私が最近イラッとしたこと',
    '今の歳になるまで知らなかったこと',
    '危うく騙されそうになった話',
    '勝手に運命を感じてしまった出来事',
    'イラッとする他人の口癖',
    '私がリスペクトしている人',
    '最近テンションが上がった出来事',
    'もらってちょっと困ったプレゼント',
    '私がずっと勘違いしていたこと',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "経験",
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
