import 'package:dio/dio.dart';
import 'package:post_crud/models/user_model.dart';

class UserApiProvider {
  Future<User> fetchUser(int id) async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/users/$id');
      final data = response.data;
      User user = User.fromJson(data as Map<String, dynamic>);
      return user;
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }
}
