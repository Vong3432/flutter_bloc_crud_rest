import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_crud/models/comment_model.dart';
import 'package:post_crud/ui/comments/widgets/comment_info.dart';

class CommentList extends StatelessWidget {
  const CommentList({Key? key, required this.comments}) : super(key: key);
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: comments.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          final Comment comment = comments[index];
          return CommentInfo(comment: comment);
        });
  }
}
