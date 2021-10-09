import 'package:post_crud/bloc/comments/comments_api_provider.dart';
import 'package:post_crud/models/comment_model.dart';

class CommentRepo {
  factory CommentRepo() {
    return _instance;
  }

  CommentRepo._constructor();

  static final CommentRepo _instance = CommentRepo._constructor();
  final CommentApiProvider _commentApiProvider = CommentApiProvider();

  Future<List<Comment>> fetchComments(int postId) async =>
      _commentApiProvider.fetchCommentsFromPost(postId);
}
