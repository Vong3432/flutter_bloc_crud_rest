part of 'comments_bloc.dart';

enum CommentsStatus { inital, loading, success, failure }

class CommentsState extends Equatable {
  const CommentsState({
    this.comments = const <Comment>[],
    this.status = CommentsStatus.inital,
  });

  CommentsState copyWith({
    List<Comment>? comments,
    CommentsStatus? status,
  }) {
    return CommentsState(
      comments: comments ?? this.comments,
      status: status ?? this.status,
    );
  }

  final List<Comment> comments;
  final CommentsStatus status;

  @override
  List<Object> get props => [comments, status];
}
