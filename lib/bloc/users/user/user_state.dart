part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

class UserState extends Equatable {
  const UserState({
    this.user,
    this.status = UserStatus.initial,
  });

  UserState copyWith({
    User? user,
    UserStatus? status,
  }) {
    return UserState(
      user: user,
      status: status ?? this.status,
    );
  }

  final User? user;
  final UserStatus status;

  @override
  List<Object?> get props => [user, status];
}
