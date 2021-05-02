import 'package:flutter/material.dart';
import 'package:doo/main.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class Custom {
  final int id;
  final String font;
  final String primaryColor;
  final String accentColor;
  final String scaffoldBackgroundColor;


  Custom({this.id, this.font, this.primaryColor, this.accentColor, this.scaffoldBackgroundColor});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'font': font,
      'primaryColor': primaryColor,
      'accentColor': accentColor,
      'scaffoldBackgroundColor': scaffoldBackgroundColor,
    };
  }

  @override
  String toString() {
    return 'Custom{id: $id, font: $font, primaryColor: $primaryColor, accentColor: $accentColor, scaffoldBackgroundColor: $scaffoldBackgroundColor}';
  }

  static Future<Database> get database async {
    final Future<Database> _database = openDatabase(
      join(await getDatabasesPath(), 'custom_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE custom(id INTEGER PRIMARY KEY AUTOINCREMENT, font STRING, primaryColor STRING, accentColor STRING, scaffoldBackgroundColor STRING)",
        );
      },
      version: 1,
    );
    return _database;
  }

  static Future<void> insertCustom(Custom custom) async {
    final Database db = await database;
    await db.insert(
      'custom',
      custom.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Custom>> getCustoms() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('custom');
    return List.generate(maps.length, (i) {
      return Custom(
        id: maps[i]['id'],
        font: maps[i]['font'],
        primaryColor: maps[i]['primaryColor'],
        accentColor: maps[i]['accentColor'],
        scaffoldBackgroundColor: maps[i]['scaffoldBackgroundColor'],
      );
    });
  }

  static Future<void> updateCustom(Custom custom) async {
    final db = await database;
    await db.update(
      'custom',
      custom.toMap(),
      where: "id = ?",
      whereArgs: [custom.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

}

class ChangeColor extends StatefulWidget {
  @override
  _ChangeColorState createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  var _primaryColor = 'e8c499';
  var _accentColor = 'd79d58';
  var _scaffoldBackgroundColor = 'd79d58';
  var _color_num = 1;
  var _isPremium = 1;

  void _get_num(int num) {
    setState(() {
      _color_num = num;
      if(num == 1){
        _primaryColor = 'e8c499';
        _accentColor = 'd79d58';
        _scaffoldBackgroundColor = 'd79d58';
      }else if(num == 2){
        _primaryColor = 'f4ac92';
        _accentColor = 'fed52b';
        _scaffoldBackgroundColor = '35b5d2';
      }else if(num == 3){
        _primaryColor = 'efe5cb';
        _accentColor = 'bfc9bd';
        _scaffoldBackgroundColor = 'c1d1e0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '色変更',
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
                            '無料テーマ',
                            style: TextStyle(
                            fontFamily: "Shigoto2",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                          padding: EdgeInsets.only(top:12,left: 28,right: 12,bottom: 12),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _get_num(1);
                              print(_color_num);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                  color: HexColor('e8c499'),
                                  border: _color_num == 1 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                            ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _get_num(2);
                              print(_color_num);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('efe5cb'),
                                  border: _color_num == 2 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                                ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _get_num(3);
                              print(_color_num);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('f4ac92'),
                                  border: _color_num == 3 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                                ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 48,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 50, left: 22, right: 22, bottom: 22),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15) // use instead of BorderRadius.all(Radius.circular(20))
                        ),
                        child: Padding(
                          child: Text(
                            'プレミアム限定テーマ',
                            style: TextStyle(
                              fontFamily: "Shigoto2",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          padding: EdgeInsets.only(top:12,left: 28,right: 12,bottom: 12),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _isPremium == 0 ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          'プレミアムプラン限定のテーマです',
                                        style: TextStyle(
                                          fontFamily: "Shigoto2",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                    );
                                  }) : _get_num(4);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('e8c499'),
                                  border: _color_num == 4 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                                ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _isPremium == 0 ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'プレミアムプラン限定のテーマです',
                                        style: TextStyle(
                                          fontFamily: "Shigoto2",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                    );
                                  }) : _get_num(5);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('e8c499'),
                                  border: _color_num == 5 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                                ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _isPremium == 0 ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'プレミアムプラン限定のテーマです',
                                        style: TextStyle(
                                          fontFamily: "Shigoto2",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                    );
                                  }) : _get_num(6);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('e8c499'),
                                  border: _color_num == 6 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                                ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _isPremium == 0 ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'プレミアムプラン限定のテーマです',
                                        style: TextStyle(
                                          fontFamily: "Shigoto2",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                    );
                                  }) : _get_num(7);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('e8c499'),
                                  border: _color_num == 7 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                                ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _isPremium == 0 ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'プレミアムプラン限定のテーマです',
                                        style: TextStyle(
                                          fontFamily: "Shigoto2",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                    );
                                  }) : _get_num(8);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('e8c499'),
                                  border: _color_num == 8 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                                ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _isPremium == 0 ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'プレミアムプラン限定のテーマです',
                                        style: TextStyle(
                                          fontFamily: "Shigoto2",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23,
                                        ),
                                      ),
                                    );
                                  }) : _get_num(9);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('e8c499'),
                                  border: _color_num == 9 ? Border.all(color: Colors.grey,width: 3) : Border.all(color: Colors.white,width: 3),
                                ),
                                height: 65.0,
                                width: 65.0
                            ),
                          ),
                        ],
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
                    _get_num(2);
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
                  onTap: () async {

                    Custom updateCustom = Custom(
                        id: 1,
                      primaryColor: _primaryColor,
                      accentColor: _accentColor,
                      scaffoldBackgroundColor: _scaffoldBackgroundColor,
                    );
                    await Custom.updateCustom(updateCustom);
                    print(_primaryColor);
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
