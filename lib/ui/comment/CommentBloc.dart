import 'package:study_app_flutter/data/network/NetworkService.dart';
import 'package:study_app_flutter/model/Comment.dart';

class CommentBlock {
  NetworkService _networkService = NetworkService();

  Stream<List<Comment>> get comments async* {
    yield await _networkService.fetchComment();
  }
}
