import 'package:flutter/material.dart';
import 'package:doo/main.dart';

class HowToUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '使い方',
          style: TextStyle(
          fontFamily: "Shigoto2",
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Card(
        margin: EdgeInsets.only(top: 23, left: 26, right: 26, bottom: 120),
        child: ListView(
          padding: EdgeInsets.only(top: 20,left: 30,right: 30,bottom: 20),
          children: <Widget>[
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 13),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15) // use instead of BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                child: Text(
                  'Todoについて',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                padding: EdgeInsets.only(top:12,left: 28,right: 12,bottom: 12),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                    'Todoを追加',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                    'Todoを削除',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                    'Todoの編集',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                  'Todoの共有',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 60, bottom: 13),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15) // use instead of BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                child: Text(
                  'その他の機能について',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                padding: EdgeInsets.only(top:12,left: 28,right: 12,bottom: 12),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                  'フォントを変える',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                  '色を変える',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 60, bottom: 13),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15) // use instead of BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                child: Text(
                  'プレミアム機能について',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                padding: EdgeInsets.only(top:12,left: 28,right: 12,bottom: 12),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                  'プレミアムプランとは？',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                  '広告を消す',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                  'フォントを選ぶ',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black26,
                    width: 0.6,
                  ),),
              ),
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text(
                  '色を選ぶ',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new MyApp(),
                  ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
