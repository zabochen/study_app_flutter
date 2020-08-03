import 'package:flutter/material.dart';
import 'package:study_app_flutter/model/Comment.dart';
import 'package:study_app_flutter/res/Strings.dart';
import 'package:study_app_flutter/ui/comment/CommentBloc.dart';

class CommentScreen extends StatefulWidget {
  @override
  CommentScreenState createState() => CommentScreenState();
}

class CommentScreenState extends State {
  CommentBlock _commentBlock = CommentBlock();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: appBar,
          body: StreamBuilder<List<Comment>>(
            stream: _commentBlock.comments,
            builder: (context, snapshot) {
              List<Comment> comments = snapshot.data;
              return (comments != null)
                  ? commentListView(context, comments)
                  : progressView;
            },
          )),
    );
  }

  var appBar = PreferredSize(
    preferredSize: const Size.fromHeight(56.0),
    child: Container(
      height: 56.0,
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
          Text(
            Strings.commentScreenAppBarTitle,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      color: Colors.blueGrey,
    ),
  );

  var progressView = Center(child: CircularProgressIndicator());

  var dividerView = Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Divider(
      height: 1,
      thickness: 1,
      color: Colors.black38,
    ),
  );

  commentListView(BuildContext context, List<Comment> comments) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => dividerView,
      itemBuilder: (context, index) =>
          commentItemView(context, comments[index]),
      itemCount: comments.length,
    );
  }

  commentItemView(BuildContext context, Comment comment) {
    return Container(
        margin: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          elevation: 4.0,
          child: InkWell(
              customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Container(
                  margin: EdgeInsets.all(20.0), child: Text(comment.body)),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("onTap => Card"),
                ));
              }),
        ));
  }
}
