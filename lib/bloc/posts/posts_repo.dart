import 'package:post_crud/bloc/posts/posts_api_provider.dart';
import 'package:post_crud/cubit/post_form_cubit.dart';
import 'package:post_crud/models/post_model.dart';

class PostRepo {
  factory PostRepo() {
    return _instance;
  }

  PostRepo._constructor();

  static final PostRepo _instance = PostRepo._constructor();
  final PostApiProvider _postApiProvider = PostApiProvider();

  Future<Post> addPost(PostFormState post) async =>
      _postApiProvider.addPost(post);
  Future<Post> editPost(PostFormState post) async =>
      _postApiProvider.editPost(post);
  Future<List<Post>> fetchPosts() async => _postApiProvider.fetchPosts();
  Future<Post> fetchPost(int id) async => _postApiProvider.fetchPost(id);
}
