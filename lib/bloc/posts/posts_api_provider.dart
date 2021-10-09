import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:post_crud/cubit/post_form_cubit.dart';
import 'package:post_crud/models/post_model.dart';

class PostApiProvider {
  Future<List<Post>> fetchPosts() async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');
      final data = response.data as List;
      List<Post> posts = List<Post>.from(
          data.map((i) => Post.fromJson(i as Map<String, dynamic>)));
      return posts;
    } on DioError catch (e) {
      debugPrint("err_item: ${e.toString()}");
      throw Exception(e.error);
    }
  }

  Future<Post> fetchPost(int id) async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts/$id');
      final data = response.data;
      Post post = Post.fromJson(data as Map<String, dynamic>);
      return post;
    } on DioError catch (e) {
      debugPrint("err_item: ${e.toString()}");
      throw Exception(e.error);
    }
  }

  Future<Post> addPost(PostFormState post) async {
    try {
      final response = await Dio().post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          "title": post.title,
          "body": post.body,
          "userId": 1,
        },
      );
      final data = response.data;
      final Post createdPost = Post.fromJson(data as Map<String, dynamic>);
      return createdPost;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }

  Future<Post> editPost(PostFormState post) async {
    try {
      debugPrint("Edit ${post.title}");
      final response = await Dio().put(
        'https://jsonplaceholder.typicode.com/posts/${post.id}',
        data: {
          "title": post.title,
          "body": post.body,
          "userId": 1,
        },
      );
      final data = response.data;
      final Post editedPost = Post.fromJson(data as Map<String, dynamic>);
      return editedPost;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }
}
