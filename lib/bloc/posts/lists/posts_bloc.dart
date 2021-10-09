import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:post_crud/bloc/posts/posts_repo.dart';
import 'package:post_crud/cubit/post_form_cubit.dart';
import 'package:post_crud/models/post_model.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostsRequested>(_onPostsRequested);
    on<PostsUpdate>(_onPostUpdate);
    on<PostsAdd>(_onPostAdd);
    on<PostsDelete>(_onPostDelete);
  }

  final PostRepo _repo = PostRepo();

  Future<void> _onPostsRequested(
    PostsRequested event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(status: PostsStatus.loading));
    final List<Post> posts = await _repo.fetchPosts();
    emit(state.copyWith(status: PostsStatus.success, posts: posts));
  }

  Future<void> _onPostAdd(
    PostsAdd event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(status: PostsStatus.loading));
    final Post post = await _repo.addPost(event.post);

    // copy previous lists and insert new post to first
    final List<Post> newList = state.posts;
    newList.insert(0, post);

    emit(
      state.copyWith(
        status: PostsStatus.success,
        posts: newList,
      ),
    );
  }

  Future<void> _onPostUpdate(
    PostsUpdate event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(status: PostsStatus.loading));
    final Post post = await _repo.editPost(event.post);

    // update single item from the list
    state.posts[state.posts.indexWhere((Post p) => p.id == post.id)] = post;

    emit(
      state.copyWith(
        status: PostsStatus.success,
        posts: state.posts,
      ),
    );
  }

  Future<void> _onPostDelete(
    PostsDelete event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(status: PostsStatus.loading));
    // remove item from the list
    state.posts
        .removeAt(state.posts.indexWhere((Post p) => p.id == event.postId));

    emit(
      state.copyWith(
        status: PostsStatus.success,
        posts: state.posts,
      ),
    );
  }
}
