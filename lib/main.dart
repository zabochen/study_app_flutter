import 'package:flutter/material.dart';
import 'package:study_app_flutter/ui/comment/CommentScreen.dart';
import 'package:study_app_flutter/screen/home.dart';
import 'package:study_app_flutter/screen/image.dart';
import 'package:study_app_flutter/screen/post.dart';
import 'package:study_app_flutter/screen/row_column_stack.dart';
import 'package:study_app_flutter/ui/counter/CounterScreen.dart';
import 'package:study_app_flutter/ui/preferences/PreferencesScreen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    routes: <String, WidgetBuilder>{
      '/imageScreen': (BuildContext buildContext) => ImageScreen(),
      '/rowColumnScreen': (BuildContext buildContext) => RowColumnScreen(),
      '/postScreen': (BuildContext buildContext) => PostScreen(),
      '/commentScreen': (BuildContext buildContext) => CommentScreen(),
      '/preferencesScreen': (BuildContext buildContext) => PreferencesScreen(),
      '/counterScreen': (BuildContext buildContext) => CounterScreen()
    },
  ));
}
