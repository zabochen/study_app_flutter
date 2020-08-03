import 'package:flutter/material.dart';
import 'package:study_app_flutter/data/preferences/PreferencesService.dart';
import 'package:study_app_flutter/res/Strings.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  PreferencesScreenState createState() => PreferencesScreenState();
}

class PreferencesScreenState extends State {
  PreferencesService _preferencesService = PreferencesService();
  int _counter = 0;

  _setCounter(int count) {
    setState(() {
      _counter = count;
    });
  }

  _getCounter() {
    _preferencesService
        .getCount()
        .then((value) => value == null ? _setCounter(0) : _setCounter(value));
  }

  _incrementCounter() {
    setState(() {
      _counter++;
    });
    _preferencesService.setCount(_counter);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.preferencesScreenAppBarTitle),
      ),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        onPressed: () {
          _incrementCounter();
        },
      ),
    );
  }

  getBody() {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              _counter.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              child: Text(
                "Increment and save",
              ),
              onPressed: () {
                _incrementCounter();
              },
            ),
          ],
        ),
      ),
    );
  }
}
