import 'package:flutter/material.dart';
import 'package:study_app_flutter/model/Post.dart';
import 'dart:async';
import 'package:study_app_flutter/data/network/NetworkService.dart';

class PostScreen extends StatefulWidget {
  @override
  PostScreenState createState() => PostScreenState();
}

class PostScreenState extends State {
  List<Post> _posts = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: getBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getBody() {
    if (needShowLoading()) {
      return getLoadingView();
    } else {
      return getPostListView();
    }
  }

  bool needShowLoading() => _posts.isEmpty;

  Widget getLoadingView() => Center(
        child: CircularProgressIndicator(),
      );

  Widget getPostListView() => ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (BuildContext context, int position) {
          return getPostListRowView(position: position);
        },
      );

  Widget getPostListRowView({int position}) => Container(
        margin: EdgeInsets.all(10),
        child: Card(
          child: Container(
            child: Column(
              children: <Widget>[
                Text("ID: ${_posts[position].id.toString()}"),
                Text("TITLE: ${_posts[position].title}"),
                Text("BODY: ${_posts[position].body}"),
              ],
            ),
          ),
        ),
      );

  loadData() async {
    List<Post> posts = await NetworkService().fetchPosts();
    setState(() {
      _posts.clear();
      _posts.addAll(posts);
    });
  }

  // Guide
  // https://api.flutter.dev/flutter/dart-async/Future-class.html
  Future<String> getData() async {
    // in catchError()
    // throw Exception("Some exception!");
    try {
      var data = await NetworkService().getData();
      return data;
    } catch (e) {
      return null;
    }
  }
}
