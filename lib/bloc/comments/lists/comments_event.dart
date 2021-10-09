part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();

  @override
  List<Object> get props => [];
}

class FetchComments extends CommentsEvent {
  const FetchComments(this.postId);
  final int postId;
}
