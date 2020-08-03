import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:study_app_flutter/model/Comment.dart';
import 'package:study_app_flutter/model/Post.dart';
import 'package:study_app_flutter/model/User.dart';

class NetworkService {
  Duration _duration = Duration(seconds: 3);
  String result = "News goes here";

  final String _baseUrl = "https://jsonplaceholder.typicode.com/";
  final String _posts = "posts";
  final String _users = "users";
  final String _comments = "comments";

  Future<String> getData() async {
    return await Future.delayed(_duration, () => result);
  }

  Future<List<Post>> fetchPosts() async {
    await Future.delayed(_duration);
    Response response = await get(_baseUrl + _posts);
    List decodeResponse = json.decode(response.body);
    List<Post> posts = List();
    posts = decodeResponse.map((value) => Post.fromJson(value)).toList();
    return posts;
  }

  Future<void> fetchUsers() async {
    Response response = await get(_baseUrl + _users);
    String body = response.body;
    List<User> users = List();
    List decodeUsers = json.decode(body);
    users = decodeUsers.map((value) => User.fromJson(value)).toList();
  }

  Future<List<Comment>> fetchComment() async {
    Response commentsResponse = await get(_baseUrl + _comments);
    List<dynamic> commentsJson = json.decode(commentsResponse.body);
    return commentsJson.map((value) => Comment.fromJson(value)).toList();
  }
}
