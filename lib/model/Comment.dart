//  {
//    "postId": 46,
//    "id": 227,
//    "name": "omnis error aut doloremque ipsum ducimus",
//    "email": "Melody@london.name",
//    "body": "est quo quod tempora fuga debitis\neum nihil nemo nisi consequatur sequi nesciunt dolorum et\ncumque maxime qui consequatur mollitia dicta iusto aut\nvero recusandae ut dolorem provident voluptatibus suscipit sint"
//  }

class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({this.postId, this.id, this.name, this.email, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body']);
  }
}
