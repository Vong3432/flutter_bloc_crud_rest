part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failed }

class PostState extends Equatable {
  const PostState({
    this.post,
    this.id,
    this.status = PostStatus.initial,
  });

  PostState copyWith({
    Post? post,
    int? id,
    PostStatus? status,
  }) {
    return PostState(
      post: post,
      id: id,
      status: status ?? this.status,
    );
  }

  // Mark as nullable for some situation where a post
  // cannot be load
  final Post? post;
  final int? id;
  final PostStatus status;

  @override
  // TODO: implement props
  List<Object?> get props => [id, post, status];
}
