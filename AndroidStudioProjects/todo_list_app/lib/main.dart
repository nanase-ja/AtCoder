//list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/db/task.dart';
import 'package:todo_list_app/pages/app_background.dart';
import 'package:todo_list_app/pages/completed_task_page.dart';

var listPageKey = GlobalKey<_ListPageState>();

class ListPage extends StatefulWidget {
  const ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool _validate = false;

//List の宣言
//List<Task>を宣言することによってTaskオブジェクトのみを格納するリストを作成します
//注意: []というふうにデフォルトを空と宣言しておかないとエラーが起きます。
  List<Task> tasks = [];

//Input fieldで使用するControllerの定義
  final TextEditingController eCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    eCtrl.dispose();
    super.dispose();
  }

//現在時刻をフォーマット化するための関数を定義
  String createDateFormat(now) {
    var formatter = DateFormat('yyyy/MM/dd/HH:mm');
    String formatted = formatter.format(now);
    return formatted;
  }

//　Validateの後に行われる処理
// Listに新しいTaskが追加される処理です。
  void addListItem(String text) {
    _validate = false;
    final Task newItem = Task(
        title: text,
        status: 'false',
        addedDate: createDateFormat(DateTime.now()),
        completedDate: '');
//tasksの0番目に新しいタスクを追加
    tasks.insert(0, newItem);
// Controllerの内容を消去する
    eCtrl.clear();
// SetStateを行うことによってWidgetの内容を更新
    setState(() {});
  }

//　Taskのアップデートを行う処理
  void updateItems(Task task, int i) {
    if (task.status == 'false') {
      final updatedTask = Task(
          title: task.title,
          status: 'true',
          addedDate: task.addedDate,
          completedDate: createDateFormat(DateTime.now()));
      //tasksのi番目のタスクを新しいタスクと入れ替える。
      tasks[i] = updatedTask;
    } else if (task.status == 'true') {
      final updatedTask = Task(
          title: task.title,
          status: 'false',
          addedDate: task.addedDate,
          completedDate: '');
      tasks[i] = updatedTask;
    }
    setState(() {});
  }

//タスクの削除を行う処理
  void removeListItem(Task task) async {
    setState(() => tasks.remove(task));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Tasks'),
          centerTitle: true,
          actions: <Widget>[
            // ③次項で作成するページです。
//            Padding(
//              padding: EdgeInsets.all(8.0),
//              child: IconButton(
//                icon: Icon(Icons.check_box),
//                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => CompletedTasks(
//                        tasks: tasks,
//                      ),
//                    ),
//                  );
//                },
//              ),
//            ),
          ],
        ),
//Stackを使用することによってZ軸上にWidgetを重ねることができます。
        body: Stack(
          children: <Widget>[
            AppBackgroundPage(),
//Columnを使用することで二つのWidgetを重ねるように配置します
            Column(
              children: <Widget>[
//後に定義するインプットボックスウィジェットを呼び出します
                buildInputContainer(),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (BuildContext context, int i) {
// List 一つのデザインを定義します。
// 好みで変更してみてください。
                      return buildListItem(tasks, i);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

//List itemの定義
  Dismissible buildListItem(List<Task> tasks, int i) {
    return Dismissible(
      key: ObjectKey(tasks[i]),
//Slidableを使うことによってwidgetを左右にスライドすることが可能になります。
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: tasks[i].status == 'false'
                  ? Text(tasks[i].addedDate)
                  : Text(tasks[i].completedDate),
              title: Text(
                tasks[i].title,
                style: TextStyle(
                    color:
                    tasks[i].status == 'false' ? Colors.black : Colors.grey,
                    decoration: tasks[i].status == 'false'
                        ? TextDecoration.none
                        : TextDecoration.lineThrough),
              ),
              leading: Icon(Icons.list),
              trailing: IconButton(
                icon: Icon(
                  (tasks[i].status == 'false')
                      ? Icons.check_box_outline_blank
                      : Icons.check_box,
                  color: Colors.greenAccent,
                ),
                onPressed: () {
                  updateItems(tasks[i], i);
                },
              ),
            ),
            Divider(height: 0)
          ],
        ),
//右にスライドした際に行う処理をここに書きます。
//今回はチェックとアンチェックを行う処理をここで行います。
        actions: <Widget>[
          tasks[i].status == 'false'
              ? IconSlideAction(
            caption: 'Complete',
            color: Colors.greenAccent,
            icon: Icons.check,
            onTap: () {
              updateItems(tasks[i], i);
            },
          )
              : IconSlideAction(
            caption: 'Undo',
            color: Colors.grey,
            icon: Icons.check,
            onTap: () {
              updateItems(tasks[i], i);
            },
          )
        ],
//右にスライドした際に行う処理をここに書きます。
//今回は削除を行う処理をここで行います。
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              removeListItem(tasks[i]);
            },
          )
        ],
      ),
    );
  }

//こちらではインプットボックスの定義を行います。
  Padding buildInputContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(8.0))),
              child: TextField(
//事前に宣言していたTextEditingController(eCtrl）をcontrollerに代入します。
                controller: eCtrl,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter your task",
                  errorText: _validate ? 'The input is empty.' : null,
                  contentPadding: EdgeInsets.all(8),
                ),
                onTap: () => setState(() => _validate = false),
//Keyboardの官僚が押された際にアイテムを追加します。
//必要なければ省略しても構いません。
                onSubmitted: (text) {
//controllerが空のときに、addListItemの処理を行わないように分岐を書きます
                  if (text.isEmpty) {
                    setState(() {
                      _validate = true;
                    });
                  } else {
                    addListItem(text);
                  }
                },
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.horizontal(right: Radius.circular(8.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.add, color: Colors.white),
              ),
              onPressed: () {
//controllerが空のときに、addListItemの処理を行わないように分岐を書きます
                if (eCtrl.text.isEmpty) {
                  setState(() => _validate = true);
                } else {
                  addListItem(eCtrl.text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
