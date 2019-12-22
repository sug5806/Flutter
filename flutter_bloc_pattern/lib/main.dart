import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/counter_bloc.dart';
import 'package:flutter_bloc_pattern/counter_event.dart';

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
  final _bloc = new CounterBloc();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
	        stream: _bloc.counter,
	        initialData: 0,
	        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
	        	return Column(
			        mainAxisAlignment: MainAxisAlignment.center,
			        children: <Widget>[
			        	Text('You have pushed the button this many times:'),
				        Text(
					        '${snapshot.data}',
					        style: Theme.of(context).textTheme.display1,
				        )
			        ],
		        );
	        }
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          new SizedBox(width: 10.0),
          new FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'decrement',
            child: Icon(Icons.remove),
          ),

        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}
