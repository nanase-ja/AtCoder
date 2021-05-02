import 'package:flutter/material.dart';
import 'package:doo/main.dart';

class ChangeFont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'フォント変更',
          style: TextStyle(
            fontFamily: "Shigoto2",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.only(top: 23, left: 26, right: 26, bottom: 20),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.all(22),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(15) // use instead of BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      child: Text(
                        'プレミアム限定フォント',
                        style: TextStyle(
                          fontFamily: "Shigoto2",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                      padding: EdgeInsets.only(top:12,left: 28,right: 12,bottom: 12),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                  ),
                  
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => new MyApp(),
                    ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 48.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: Colors.white,
                      border: Border.all(color: HexColor('e8c499'),width: 3),
                    ),
                    child: Container(
                      child: Center(
                        child: const Text(
                          'キャンセル',
                          style: TextStyle(
                            fontFamily: "Shigoto2",
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('保存の動作の確認'),
                          );
                        });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    height: 48.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: HexColor('e8c499'),
                      border: Border.all(color: Colors.white,width: 4),
                    ),
                    child: Container(
                      child: Center(
                        child: const Text(
                          '保存',
                          style: TextStyle(
                            fontFamily: "Shigoto2",
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
