import 'package:post_crud/bloc/users/users_api_provider.dart';
import 'package:post_crud/models/user_model.dart';

class UserRepo {
  factory UserRepo() {
    return _instance;
  }

  UserRepo._constructor();

  static final UserRepo _instance = UserRepo._constructor();
  final UserApiProvider _userApiProvider = UserApiProvider();

  Future<User> fetchUser(int id) async => _userApiProvider.fetchUser(id);
}
