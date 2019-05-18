import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //应用名称
      title: 'My First Flutter App',
      theme: new ThemeData(
        //亮蓝色主题
        primarySwatch: Colors.lightBlue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
      },
      //应用首页路由
      home: new MyHomePage(title:'My First Flutter App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key:key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
 
  void _incrementCounter() {
    setState(() {
     _counter++; 
    });
  }

   @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '你可以点击这个按钮很多次'
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('打开新的路由'),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                // Navigator.push(context, new MaterialPageRoute(
                //   builder: (context) {
                //     return new NewRoute();
                //   }
                // ));
                Navigator.of(context).pushNamed("new_page",arguments: "hi, this is new page");
              },
            ),
            RandomWordsWidget(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

}

class NewRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  //获取路由参数
  var args = ModalRoute.of(context).settings.arguments;

    return new Scaffold(
      appBar: AppBar(
        title: Text('New Route'),
      ),
      body: Center(
        child: Text(args),
      ),
    );
  }

}

class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }

}