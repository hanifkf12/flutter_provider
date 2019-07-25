import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';

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
      home: ChangeNotifierProvider<CounterModel>(

          builder: (_) => CounterModel(),
          child: CounterView()),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Demo'),
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 80.0,
          padding:
              EdgeInsets.only(left: 10.0, top: 0.0, right: 10.0, bottom: 0.0),
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'You have pushed the button this many times:',
                ),
              ),
              Text(
                counterModel.getCounter.toString(),
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counterModel.decreament(),
            tooltip: 'Decreament',
            child: Icon(Icons.remove),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          FloatingActionButton(
            onPressed: () => counterModel.increament(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
