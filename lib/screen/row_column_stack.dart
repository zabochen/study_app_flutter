import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:study_app_flutter/extension/ui.dart';

class RowColumnScreen extends StatefulWidget {
  @override
  _RowColumnScreenState createState() => _RowColumnScreenState();
}

class _RowColumnScreenState extends State<RowColumnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getCustomAppBar(context),
      body: NewsStack(),
    );
  }
}

_getCustomAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(56),
    child: Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      //margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.tealAccent,
            Colors.redAccent,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.adb), onPressed: () {}),
          Text(
            'Custom AppBar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Container(
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.add_a_photo), onPressed: () {}),
                IconButton(icon: Icon(Icons.print), onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class NewsStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("nature.jpg"), fit: BoxFit.cover)),
        ),
        Positioned(
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("Some text 1"),
                  margin: EdgeInsets.all(40),
                )
              ],
            ),
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          left: 20,
          right: 20,
          bottom: 20,
        ),
      ],
    );
  }
}

class _ImageDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.red,
        Colors.amber,
        Colors.blueAccent,
        Colors.black
      ])),
      child: Image.asset("flutter.png"),
    );
  }
}

class _ImageWithTextContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.amberAccent,
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset("nature.jpg"),
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                "Figure 1",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            )
          ],
        ));
  }
}

class _WrapContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          children: <Widget>[
            Container(
              color: Colors.red,
              margin: EdgeInsets.only(top: 50),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Image.asset(
                            "nature.jpg",
                            width: 100,
                          ),
                        )),
                  ),
                  GestureDetector(
                      onTap: () {
                        context.showSnackbar("Click image");
                      },
                      onLongPress: () {
                        context.showSnackbar("Long press");
                      },
                      child: Expanded(
                        flex: 1,
                        child: Image.asset(
                          "nature.jpg",
                          width: 100,
                        ),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}

class _Row extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            child: Image.asset(
          "nature.jpg",
          width: 100,
          height: 100,
        )),
        Container(
            child: Image.asset(
          "nature.jpg",
          width: 100,
          height: 100,
        )),
        Container(
            child: Image.asset(
          "nature.jpg",
          width: 100,
          height: 100,
        ))
      ],
    );
  }
}

class _Column extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: Image.asset(
          "nature.jpg",
          width: 100,
          height: 100,
        )),
        Container(
            child: Image.asset(
          "nature.jpg",
          width: 100,
          height: 100,
        )),
        Container(
            child: Image.asset(
          "nature.jpg",
          width: 100,
          height: 100,
        ))
      ],
    );
  }
}
