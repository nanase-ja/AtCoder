import 'package:flutter/material.dart';
import 'package:youtube_app/video_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: Icon(Icons.videocam),
          title: const Text(
              'KBOYのFlutter大学',
          ),
          actions: [
            SizedBox(
              width: 44,
              child: FlatButton(
                child: Icon(Icons.search),
                onPressed: (){
                  // todo
                },
              ),
            ),
            SizedBox(
              width: 44,
              child: FlatButton(
                child: Icon(Icons.more_vert),
                onPressed: (){
                  // todo
                },
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                     height: 60,
                     child: Image.network(
                       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG5iUyXLi3gJsEn_Tystc1ZthqVOr7xX5KNQ&usqp=CAU'
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: [
                        const Text(
                          'KBOYのFlutter大学'
                        ),
                        FlatButton(
                          child: Row(
                            children: [
                              Icon(
                                  Icons.video_call,
                                color: Colors.red,
                              ),
                              Text('登録する')
                            ],
                          ),
                            onPressed: (){
                              // todo
                              },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoDetailPage()),
                        );
                      },
                      contentPadding: EdgeInsets.all(8),
                      leading: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBNEkaJfDcDnOUVRb-uV42yE40Pnta4PkwVQ&usqp=CAU'
                      ),
                      title: Column(
                        children: <Widget>[
                          Text(
                            '【小松菜奈】リストを作る方法',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        Row(
                          children: [
                            Text(
                              '260万回再生',
                              style: TextStyle(fontSize: 13),
                            ),
                            Text(
                              '5日前',
                              style: TextStyle(fontSize: 13),
                            ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
