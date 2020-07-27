import 'package:flutter/material.dart';
import 'package:study_app_flutter/string.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
