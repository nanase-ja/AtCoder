import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class  Renai extends StatelessWidget {
  var listItem = [
    '私の淡い片思い',
    '私がデートでやらかしたとんでもない失敗',
    'ちょっと変わった私の元カレ・元カノ',
    '私の好きな異性の服装',
    '私がキュンとする異性の仕草',
    '私、実は〇〇フェチなんです',
    '私が今までに告白されたことある人数',
    '私の理想のデートプラン',
    '私が恋人に求める条件',
    'カラオケで異性に歌って欲しい曲',
    '人生で一番モテた時期',
    '勝手に運命を感じてしまった出来事',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "恋愛",
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
