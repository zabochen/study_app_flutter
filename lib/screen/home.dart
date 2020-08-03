import 'package:flutter/material.dart';
import 'package:study_app_flutter/extension/navigation.dart';
import 'package:study_app_flutter/string.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                print("onPressed");
                Navigator.of(context).pushNamed('/imageScreen');
              },
              child: Text("Open Image Screen"),
            ),
            RaisedButton(
              child: Text("Open Row Column Screen"),
              onPressed: () {
                context.navigateTo("/rowColumnScreen");
              },
            ),
            RaisedButton(
              child: Text("Open News Screen"),
              onPressed: () {
                context.navigateTo("/postScreen");
              },
            ),
            RaisedButton(
              child: Text("Open Comment Screen"),
              onPressed: () {
                context.navigateTo("/commentScreen");
              },
            ),
            RaisedButton(
              child: Text("Open Preferences Screen"),
              onPressed: () {
                context.navigateTo("/preferencesScreen");
              },
            ),
            RaisedButton(
              child: Text("Open Counter Screen"),
              onPressed: () {
                context.navigateTo("/counterScreen");
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.amber,
      appBar: AppBar(
        leading: Icon(Icons.adb),
        title: Text(
          Strings.homeScreenTitle,
          style: TextStyle(
            color: Colors.red,
            fontSize: 23.0,
          ),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => {print("Click - account_circle")}),
          IconButton(
            icon: Icon(Icons.account_balance),
            onPressed: () => {print("Click - account_balance")},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo), title: Text("Photo")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alarm), title: Text("Alarm"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Message"),
          ));
          _currentIndex++;
        },
      ),
    );
  }
}
