import 'package:flutter/material.dart';
import 'package:study_app_flutter/res/Strings.dart';
import 'package:study_app_flutter/ui/counter/CounterBloc.dart';
import 'package:study_app_flutter/ui/counter/CounterEvent.dart';

class CounterScreen extends StatefulWidget {
  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.counterScreenAppBarTitle),
      ),
      body: getBody(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.dispose();
  }

  getBody() {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(30.0),
                child: StreamBuilder(
                  stream: _counterBloc.outCounterState,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    return snapshot.data == null
                        ? Text("0")
                        : Text(snapshot.data.toString());
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("+"),
                  onPressed: () {
                    _counterBloc.inCounterEvent.add(IncrementEvent());
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  child: Text("-"),
                  onPressed: () {
                    _counterBloc.inCounterEvent.add(DecrementEvent());
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
