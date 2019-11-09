import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "To-do's"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> list = new List();
  //var cont = 0;
  List<Widget> ListMyWidgets(x){
    var size = list.length + 1;
    list.add(new Text('$size. $x',style: TextStyle(fontSize: 30),));
    return list;
  }
  List<Widget> RemoveMyTodos(){
    list.removeRange(0,list.length);
  }

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
              Container(
              margin: const EdgeInsets.all(10.0),
              child:SizedBox(
                width: 300,
                child: TextField(
                  controller: controller,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Qualquer text',
                  ),
                ),
            ),
            ),
           FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                setState(() {
                  if(controller.text == ""){
                    
                  }else{
                    ListMyWidgets(controller.text);
                    controller.text = "";
                  }
                });
              },
              child: Text(
                "Add to do",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                setState(() {
                  RemoveMyTodos();
                });
              },
              child: Text(
                "Exclude all to do's",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Column( 
                children: list, 
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
