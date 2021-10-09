import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:post_crud/models/comment_model.dart';
import 'package:post_crud/ui/users/widgets/user_info.dart';

class CommentInfo extends StatefulWidget {
  const CommentInfo({Key? key, required this.comment}) : super(key: key);

  final Comment comment;

  @override
  State<CommentInfo> createState() => _CommentInfoState();
}

class _CommentInfoState extends State<CommentInfo> {
  Random random = Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          _buildHeader(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final CupertinoTextThemeData _theme = CupertinoTheme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.comment.name,
            style: _theme.textStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Text(
            widget.comment.body,
            style: _theme.textStyle.copyWith(
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return UserInfo(userId: random.nextInt(10) + 1);
  }
}
