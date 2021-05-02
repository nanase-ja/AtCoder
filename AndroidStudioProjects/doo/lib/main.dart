import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:share/share.dart';
import 'package:doo/NotificationPlugin.dart';
import 'dart:io' show File, Platform;
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:doo/ChangeColor.dart';
import 'package:doo/ChangeFont.dart';
import 'package:doo/HowToUse.dart';


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

  static Future<void> insertMemo(Memo memo) async {
    final Database db = await database;
    await db.insert(
      'memo',
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
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

  static Future<void> updateMemo(Memo memo) async {
    final db = await database;
    await db.update(
      'memo',
      memo.toMap(),
      where: "id = ?",
      whereArgs: [memo.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  static Future<void> deleteMemo(int id) async {
    final db = await database;
    await db.delete(
      'memo',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _primaryColor = '#f4ac92';
  var _accentColor = '#f4ac92';
  var _scaffoldBackgroundColor = '#35b5d2';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '手書き文字Todo',
      theme: new ThemeData(
        primaryColor: HexColor('f4ac92'),
        accentColor: HexColor('fed52b'),
        scaffoldBackgroundColor: HexColor('35b5d2'),
      ),
      home: MySqlPage(),
    );
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

class MySqlPage extends StatefulWidget {
  @override
  _MySqlPageState createState() => _MySqlPageState();
}

class _MySqlPageState extends State<MySqlPage> {
  List<Memo> _memoList = [];
  List<Custom> _customList = [];
  final myController = TextEditingController();
  var _selectedvalue;

  Future<void> initializeDemo() async {
    _memoList = await Memo.getMemos();
    final List<Custom> customs =
    await Custom.getCustoms();
    _customList = await Custom.getCustoms();
    if (customs == null) {
      Custom custom = Custom(
          font: 'Shigoto2',
          primaryColor: '#f4ac92',
          accentColor: '#fed52b',
          scaffoldBackgroundColor: '#35b5d2'
      );
      await Custom.insertCustom(custom);
    }
  }
  
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid =
    new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '手書き文字Todo',
          style: TextStyle(
            fontFamily: "Shigoto2",
            fontWeight: FontWeight.bold,
          ),
        ),
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
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: StatefulBuilder(
                                  builder:
                                      (BuildContext context, StateSetter setState) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(bottom: 24),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'メモの編集',
                                                style: TextStyle(
                                                  fontFamily: "Shigoto2",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23,
                                                ),
                                              ),
                                              SizedBox(
                                                width:40,
                                                child: IconButton(
                                                  icon: Icon(Icons.arrow_circle_up),
                                                  onPressed: () {
                                                    Share.share('${_memoList[index].text}');
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Flexible(
                                              flex: 3,
                                              child: TextFormField(
                                                  maxLines: null,
                                                controller: upDateController,
                                              ),
                                            ),
                                          ],
                                        ),
                                        RaisedButton(
                                          child: Text(
                                              '更新',
                                            style: TextStyle(
                                              fontFamily: "Shigoto2",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          onPressed: () async {
                                            _selectedvalue = _memoList[index].id;
                                            Memo updateMemo = Memo(
                                                id: _selectedvalue,
                                                text: upDateController.text
                                            );
                                            await Memo.updateMemo(updateMemo);
                                            final List<Memo> memos =
                                            await Memo.getMemos();
                                            super.setState(() {
                                              _memoList = memos;
                                            });
                                            upDateController.clear();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            });
                      },
                    trailing: SizedBox(
                      width: 64,
                      height: 30,
                      child: RaisedButton(
                        onPressed: () async {
                          await Memo.deleteMemo(_memoList[index].id);
                          final List<Memo> memos = await Memo.getMemos();
                          setState(() {
                            _memoList = memos;
                          });
                        },
                        child: Text(
                          '削除',
                          style: TextStyle(
                            fontFamily: "Shigoto2",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        color: HexColor('d79d58'),
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                  'プレミアムプラン',
                style: TextStyle(
                  fontFamily: "Shigoto2",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: HexColor('e8c499'),
              ),
            ),
            ListTile(
              leading:Icon(Icons.auto_awesome),
              title: Align(
                child: new Text(
                  'プレミアムプラン',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment(-1.1, 0),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:Icon(Icons.font_download_outlined),
              title: Align(
                child: new Text(
                  'フォント変更',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment(-1.1, 0),
              ),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new ChangeFont(),
                ),
                );
              },
            ),
            ListTile(
              leading:Icon(Icons.color_lens_outlined),
              title: Align(
                child: new Text(
                  '色変更',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment(-1.1, 0),
              ),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new ChangeColor(),
                ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(20),
            ),
            ListTile(
              leading:Icon(Icons.account_box_outlined),
              title: Align(
                child: new Text(
                  'お問い合わせ',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment(-1.1, 0),
              ),
              onTap: (){
                _launchURL('https://forms.gle/xE9Bekm4offA4idY9');
              },
            ),
            ListTile(
              leading:Icon(Icons.announcement_outlined),
              title: Align(
                child: new Text(
                  '使い方',
                  style: TextStyle(
                    fontFamily: "Shigoto2",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                alignment: Alignment(-1.1, 0),
              ),
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => new HowToUse(),
                ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(
                        "新規メモ",
                      style: TextStyle(
                        fontFamily: "Shigoto2",
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          maxLines: null,
                            controller: myController
                        ),
                        RaisedButton(
                          child: Text(
                            '保存',
                            style: TextStyle(
                              fontFamily: "Shigoto2",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () async {
                            Memo _memo = Memo(text: myController.text);
                            await Memo.insertMemo(_memo);
                            final List<Memo> memos = await Memo.getMemos();
                            setState(() {
                              _memoList = memos;
                              _selectedvalue = null;
                            });
                            myController.clear();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
