import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_crud/bloc/comments/lists/comments_bloc.dart';
import 'package:post_crud/bloc/posts/post/post_bloc.dart';
import 'package:post_crud/models/post_model.dart';
import 'package:post_crud/ui/comments/widgets/comment_list.dart';
import 'package:post_crud/ui/users/widgets/user_info.dart';
import 'package:post_crud/ui/widgets/list_loading_skeleton.dart';
import 'package:post_crud/ui/widgets/loading_spinner.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final CommentsBloc _commentsBloc = CommentsBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPostDetail();
  }

  @override
  Widget build(BuildContext context) {
    final CupertinoTextThemeData _theme = CupertinoTheme.of(context).textTheme;

    return BlocProvider<CommentsBloc>(
      create: (context) => _commentsBloc,
      child: CupertinoPageScaffold(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "Post detail",
                    style: _theme.textStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BlocConsumer<PostBloc, PostState>(
                  listener: (BuildContext context, PostState state) {
                    switch (state.status) {
                      case PostStatus.success:
                        _loadPostComments();
                        break;
                      default:
                    }
                  },
                  builder: (BuildContext context, PostState state) {
                    switch (state.status) {
                      case PostStatus.loading:
                        return const LoadingSpinner();
                      case PostStatus.success:
                        return _buildPost(state.post);
                      default:
                        return const LoadingSpinner();
                    }
                    ;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPost(Post? post) {
    final CupertinoTextThemeData _theme = CupertinoTheme.of(context).textTheme;

    if (post == null) {
      return const Center(
        child: Text("Not able to load post"),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          post.title,
          style: _theme.textStyle.copyWith(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          post.body,
          style: _theme.textStyle.copyWith(
            color: Colors.black.withOpacity(0.75),
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 18),
        Text(
          "Author: ",
          style: _theme.textStyle.copyWith(
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: <Widget>[
            UserInfo(
              userId: post.userId,
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.comment),
            ),
            Text(
              "Comments ",
              style: _theme.textStyle.copyWith(
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w600,
                fontSize: 21,
              ),
            ),
          ],
        ),
        _buildCommentList(),
      ],
    );
  }

  Widget _buildCommentList() {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (BuildContext context, CommentsState state) {
        switch (state.status) {
          case CommentsStatus.success:
            return CommentList(comments: state.comments);
          case CommentsStatus.loading:
            return const ListLoadingSkeleton();
          default:
            return Text(
              "No comments",
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
              ),
            );
        }
      },
    );
  }

  void _loadPostDetail() {
    BlocProvider.of<PostBloc>(context).add(PostRequested(id: widget.post.id));
  }

  void _loadPostComments() {
    _commentsBloc.add(FetchComments(widget.post.id));
  }
}
