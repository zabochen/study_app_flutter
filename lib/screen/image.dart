import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageScreeState();
  }
}

class ImageScreeState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Screen"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                "nature.jpg",
                width: 100,
                height: 100,
              )
            ],
          ),
        ));
  }
}
