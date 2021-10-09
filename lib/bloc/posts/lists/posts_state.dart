part of 'posts_bloc.dart';

enum PostsStatus { initial, loading, success, failed }

class PostsState extends Equatable {
  const PostsState({
    this.posts = const <Post>[],
    this.isMax = false,
    this.status = PostsStatus.initial,
  });

  final List<Post> posts;
  final bool isMax;
  final PostsStatus status;

  PostsState copyWith({
    List<Post>? posts,
    bool? isMax,
    PostsStatus? status,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      isMax: isMax ?? this.isMax,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [posts, isMax, status];
}

class PostState extends Equatable {
  const PostState({
    this.post,
    required this.id,
  });

  PostState copyWith({
    Post? post,
    int? id,
  }) {
    return PostState(
      post: post,
      id: id ?? this.id,
    );
  }

  // Mark as nullable for some situation where a post
  // cannot be load
  final Post? post;
  final int id;

  @override
  // TODO: implement props
  List<Object?> get props => [id, post];
}
