import 'package:flutter/material.dart';
import 'package:flutter_bloc_rxdadrt/counterbloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  CounterBloc _counterBloc = new CounterBloc(initialCount: 0);

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
            Text(
              'You have pushed the button this many times:',
            ),
            new StreamBuilder(stream: _counterBloc.counterObservable, builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              if (snapshot.hasData) {
                return Text('${snapshot.data}', style: Theme.of(context).textTheme.display1,);
              } else{
                return null;
              }
            })
          ],
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
            onPressed: _counterBloc.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),

          FloatingActionButton(
            onPressed: _counterBloc.decrement,
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
