import 'package:flutter/material.dart';
import 'package:topiker/couple.dart';
import 'package:topiker/habits.dart';
import 'package:topiker/experience.dart';
import 'package:topiker/kyukyoku.dart';
import 'package:topiker/desire.dart';
import 'package:topiker/renai.dart';
import 'package:topiker/mylist.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
    title: 'TOPIKER',
    debugShowCheckedModeBanner: false,
  ));
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOPIKER',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}

// 状態
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  // 更新
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    // ページ1の画面
    PageContents1(),
    // ページ2の画面
    PageContents2(),
    // ページ3の画面
    PageContents3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TOPIKER',
          style: TextStyle(
              color: Colors.indigoAccent,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      // 下のナビゲーションボタン
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Topicks'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            title: Text('Random'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            // ignore: deprecated_member_use
            title: Text('Menu'),
          ),
        ],

        // 選択
        currentIndex: _selectedIndex,
        // タップできるように
        onTap: _onItemTapped,
      ),
    );
  }
}


class PageContents1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.only(top: 22,left: 25,right: 25,bottom:4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          child: const Text(
                              'マイリスト',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (context) => new MyList(),
                            ),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              );
            },
            childCount: 1,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.hardEdge,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new Kyukyoku())
                        );
                      },
                      child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'images/kyukyoku.jpg',fit: BoxFit.cover,
                              color: Colors.black26,
                              colorBlendMode: BlendMode.darken,
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.all(30.0),
                                child: Text("究極選択",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0,
                                    color: Colors.white,
                                  ),),
                              ),
                            )
                          ],
                      ),
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Desire())
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'images/desire.jpeg',
                          color: Colors.black26,
                          colorBlendMode: BlendMode.darken,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(30.0),
                            child: Text("願望",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: Colors.white,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Experience())
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'images/experience.jpeg',
                          fit: BoxFit.cover,
                          color: Colors.black26,
                          colorBlendMode: BlendMode.darken,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(30.0),
                            child: Text(
                              "経験",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: Colors.white,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Habits())
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'images/habits.jpg',
                          fit: BoxFit.cover,
                          color: Colors.black26,
                          colorBlendMode: BlendMode.darken,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(30.0),
                            child: Text(
                              "習慣",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: Colors.white,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Couple())
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'images/couple.jpg',
                          fit: BoxFit.cover,
                          color: Colors.black26,
                          colorBlendMode: BlendMode.darken,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(30.0),
                            child: Text(
                              "カップル",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: Colors.white,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.hardEdge,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Renai())
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          'images/renai.jpg',
                          fit: BoxFit.cover,
                          color: Colors.black26,
                          colorBlendMode: BlendMode.darken,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.all(30.0),
                            child: Text(
                              "恋愛",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                                color: Colors.white,
                              ),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PageContents2 extends StatefulWidget {
  @override
  _PageContents2State createState() => _PageContents2State();
}

class _PageContents2State extends State<PageContents2> {
  int _selectedIndex = 0;

  var listItem = [
    '旅行先で遭遇したハプニング',
    '一番楽しかった旅行先',
    '私が最近お出かけしたスポット',
    '私が最近気になっている注目スポット',
    'みんなに喜ばれるイチオシのお土産',
    '私が愛用している服屋さん',
    '私が愛用している注目アイテム',
    '私が好きなブランド',
    '私のマイブーム',
    '私が最近ハマっているアプリ',
    '私が最近ゲットしたもの',
    '私が昔ハマったゲーム',
    '私が今一番欲しいもの',
    '私が最近夢中になっていること',
    '最近気になっているニュース',
    '私が昔ハマっていた〇〇',
    '私が大好きだったテレビ番組',
    '飼ってみたいペット',
    '子供に名前を付けるなら',
    '待ち遠しくて仕方のないもの',
    'もしも願いが叶うなら',
    'いつかは挑戦してみたいこと',
    '私のささやかな夢',
    'チャレンジしてみたいこと',
    'やり直せるならやり直したいこと',
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
    '勝手に運命を感じてしまった出来事',
  ];


  void _onItemTapped() {
    setState(() {
      _selectedIndex = Random().nextInt(listItem.length);
    });
  }


  @override
  Widget build(BuildContext context) {
    int _selectedIndex = Random().nextInt(listItem.length);
    return Column(
      children: [
        Container(
          height: 280,
          margin: EdgeInsets.only(top:100.0),
          padding: const EdgeInsets.all(15),
          child:
          Card(
            child: Center(
              child: ListTile(
                title: Text(
                  listItem[_selectedIndex],
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 150,
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 61.0,
                  child: RaisedButton(
                    child: const Text(
                      '次のトピック',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    onPressed: () {
                      _onItemTapped();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class PageContents3 extends StatelessWidget {

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 13.0,horizontal: 4.0),
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.mail),
          title: Text('ご意見・ご要望'),
          onTap: (){
            _launchURL('https://forms.gle/63GCA5cUK8xroFBs5');
          },
        ),
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text('開発者  (Twitter)'),
          onTap: (){
            _launchURL('https://twitter.com/gojila0077');
          },
        ),
      ],
    );
  }
}






