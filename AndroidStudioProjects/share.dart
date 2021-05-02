import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class Memo {
  final int id;
  final String text;

  Memo({this.id, this.text});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }

  @override
  String toString() {
    return 'Memo{id: $id, text: $text}';
  }

  static Future<Database> get database async {
    final Future<Database> _database = openDatabase(
      join(await getDatabasesPath(), 'memo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE memo(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT)",
        );
      },
      version: 1,
    );
    return _database;
  }

  static Future<List<Memo>> getMemos() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('memo');
    return List.generate(maps.length, (i) {
      return Memo(
        id: maps[i]['id'],
        text: maps[i]['text'],
      );
    });
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  List<Memo> _memoList = [];
  final myController = TextEditingController();
  var _selectedvalue;

  Future<void> initializeDemo() async {
    _memoList = await Memo.getMemos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo共有',
          style: TextStyle(
            fontFamily: "Shigoto2",
            fontWeight: FontWeight.bold,
          ),
        ),
          actions:<Widget>[
            SizedBox(
              width:75,
              child: FlatButton(
                child:Icon(Icons.share),
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new Share(),
                  ),
                  );
                },
              ),
            ),
          ]
      ),
      body: Container(
        padding: EdgeInsets.all(22),
        child: FutureBuilder(
          future: initializeDemo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 非同期処理未完了 = 通信中
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: _memoList.length,
              itemBuilder: (context, index) {
                final upDateController = TextEditingController(text: '${_memoList[index].text}');
                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(18.0),
                    title: Text(
                      '${_memoList[index].text}',
                      style: TextStyle(
                        fontFamily: "Shigoto2",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


