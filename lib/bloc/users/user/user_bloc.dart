import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_crud/bloc/users/users_repo.dart';
import 'package:post_crud/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<FetchUser>(_loadUser);
  }

  final UserRepo _repo = UserRepo();

  Future<void> _loadUser(
    FetchUser event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(state.copyWith(status: UserStatus.loading));
      final User user = await _repo.fetchUser(event.userId);
      emit(state.copyWith(status: UserStatus.success, user: user));
    } catch (e) {
      emit(state.copyWith(status: UserStatus.failure));
    }
  }
}
