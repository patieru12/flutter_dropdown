import 'package:flutter/material.dart';
import 'Utils/Api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drop Down List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Drop Down List'),
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
  int _counter = 0;
  List<String> itemNameList = List<String>();
  String selectItemName;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List itemsFetched(List<String>data){
    // print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: Api.fetchItems(),
              builder: (context, snapshot){
                // print(snapshot.data.runtimeType);
                if(snapshot.hasData){
                  return DropdownButton(
                    value: selectItemName,
                    items: snapshot.data.map<DropdownMenuItem<String>>((item){
                      // print(item.runtimeType);
                      return DropdownMenuItem<String>(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (newItem){
                      setState(() {
                        selectItemName = newItem;
                      });
                    },
                    hint: Text("Select Type"),
                    disabledHint: Text("Selection Disabled!"),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
