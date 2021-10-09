import 'package:dio/dio.dart';
import 'package:post_crud/models/comment_model.dart';

class CommentApiProvider {
  Future<List<Comment>> fetchCommentsFromPost(int postId) async {
    try {
      final response = await Dio()
          .get('https://jsonplaceholder.typicode.com/comments?postId=$postId');
      final data = response.data as List;
      List<Comment> comments = List<Comment>.from(
          data.map((i) => Comment.fromJson(i as Map<String, dynamic>)));
      return comments;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }
}
