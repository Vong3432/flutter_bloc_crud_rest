part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class PostsRequested extends PostsEvent {}

class PostsUpdate extends PostsEvent {
  PostsUpdate(this.post);

  final PostFormState post;
}

class PostsAdd extends PostsEvent {
  PostsAdd(this.post);

  final PostFormState post;
}

class PostsDelete extends PostsEvent {
  PostsDelete(this.postId);

  final int postId;
}
