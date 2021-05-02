import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class  Habits extends StatelessWidget {
  var listItem = [
    '私のモーニングルーティーン',
    '私のナイトルーティーン',
    '私が美容・健康で気をつけていること',
    '私が最近頑張っていること',
    'いつも欠かさずやっている私の日課',
    '私が毎年必ずやっていること',
    '私が毎年この時期に欠かさずやっていること',
    'どうしても治らない私のクセ',
    '私が通勤・通学中にしていること',
    '私なりに工夫していること',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "習慣",
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
