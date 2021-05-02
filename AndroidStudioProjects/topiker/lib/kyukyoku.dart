import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class Kyukyoku extends StatelessWidget {
  var listItem = [
    '次生まれ変わるとしたら、男と女どっちに生まれたい?',
    '未来が読める能力と、人の心が読める能力、欲しいのはどっち？',
    '一年中真夏、一年中真冬、どっちの世界がいい？',
    '時間にルーズな恋人、お金にルーズな恋人、選ぶならどっち？',
    '明日世界が滅びるとしたら、家族と過ごす、好きな人と過ごす、どっち？',
    'きのこの山、竹の子の里、選ぶならどっち？',
    '幽霊が出る家、ゴキブリだらけの家、選ぶならどっち？',
    '給料低いけど定時にあがれる、給料高いけど毎日12時間労働、選ぶならどっち？',
    '性格がいいブサイク、性格が悪いイケメン・美女、付き合うならどっち？',
    'なんの取柄もないけどルックスは最高、才能に溢れているけど顔はブサイク、生まれ変わるならどっち？',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "究極選択",
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
