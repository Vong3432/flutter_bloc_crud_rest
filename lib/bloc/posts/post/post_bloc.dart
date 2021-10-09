import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:post_crud/bloc/posts/posts_repo.dart';
import 'package:post_crud/models/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostRequested>(_onPostRequested);
  }

  final PostRepo _repo = PostRepo();

  Future<void> _onPostRequested(
    PostRequested event,
    Emitter<PostState> emit,
  ) async {
    emit(state.copyWith(status: PostStatus.loading));
    final Post post = await _repo.fetchPost(event.id);
    emit(state.copyWith(status: PostStatus.success, post: post));
  }
}
