import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class  Desire extends StatelessWidget {
  var listItem = [
    '飼ってみたいペット',
    '子供に名前を付けるなら',
    '待ち遠しくて仕方のないもの',
    'もしも願いが叶うなら',
    'いつかは挑戦してみたいこと',
    '私のささやかな夢',
    'チャレンジしてみたいこと',
    'やり直せるならやり直したいこと',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "願望",
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
