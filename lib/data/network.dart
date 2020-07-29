import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:study_app_flutter/data/model/Post.dart';
import 'package:study_app_flutter/data/model/User.dart';

class NetworkService {
  Duration _duration = Duration(seconds: 3);
  String result = "News goes here";

  String urlPosts = "https://jsonplaceholder.typicode.com/posts";
  String urlUsers = "https://jsonplaceholder.typicode.com/users";

  Future<String> getData() => Future.delayed(_duration, () => result);

  Future<List<Post>> fetchPosts() async {
    await Future.delayed(_duration);
    Response response = await get(urlPosts);
    List decodeResponse = json.decode(response.body);
    List<Post> posts = List();
    posts = decodeResponse.map((value) => Post.fromJson(value)).toList();
    return posts;
  }

  Future<void> fetchUsers() async {
    Response response = await get(urlUsers);
    String body = response.body;

    List<User> users = List();
    List decodeUsers = json.decode(body);
    users = decodeUsers.map((value) => User.fromJson(value)).toList();
    users.forEach((user) {
      print(user.city);
    });
  }
}
