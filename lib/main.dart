import 'package:flutter/material.dart';
import 'package:study_app_flutter/screen/home.dart';
import 'package:study_app_flutter/screen/image.dart';
import 'package:study_app_flutter/screen/post.dart';
import 'package:study_app_flutter/screen/row_column_stack.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: <String, WidgetBuilder>{
      '/imageScreen': (BuildContext buildContext) => ImageScreen(),
      '/rowColumnScreen': (BuildContext buildContext) => RowColumnScreen(),
      '/postScreen': (BuildContext buildContext) => PostScreen()
    },
  ));
}
