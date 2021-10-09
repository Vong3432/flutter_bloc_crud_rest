import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_crud/bloc/comments/comments_repo.dart';
import 'package:post_crud/models/comment_model.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(const CommentsState()) {
    on<FetchComments>(_loadCommentsFromPost);
  }

  final CommentRepo _repo = CommentRepo();

  Future<void> _loadCommentsFromPost(
    FetchComments event,
    Emitter<CommentsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: CommentsStatus.loading));
      final List<Comment> comments = await _repo.fetchComments(event.postId);
      emit(
        state.copyWith(
          status: CommentsStatus.success,
          comments: comments,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: CommentsStatus.failure));
    }
  }
}
