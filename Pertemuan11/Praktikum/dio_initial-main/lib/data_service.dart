import 'package:dio/dio.dart';

import 'user.dart';

class DataService {
  final Dio dio = Dio();
  final String _baseUrl = 'https://reqres.in';

  Future getUsers() async {
    try {
      final Response response = await dio.get('$_baseUrl/api/users');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future postUser(String name, String job) async {
  Future<UserCreate?> postUser(UserCreate user) async {
    try {
      final Response response = await dio.post(
        '$_baseUrl/api/users',
        data: user.toJson(),
      );

      if (response.statusCode == 201) {
        return UserCreate.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserPut?> putUser(UserPut user) async {
    try {
      final Response response = await dio
          .put('$_baseUrl/api/users/${user.id}', data: user.toJson());

      if (response.statusCode == 200) {
        return UserPut.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser(String idUser) async {
    try {
      final Response response = await dio.delete('$_baseUrl/api/users/$idUser');

      if (response.statusCode == 204) {
        return 'data berhasil dihapus';
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Iterable<User>?> getUserModel() async {
    try {
      final Response response = await dio.get('$_baseUrl/api/users');

      if (response.statusCode == 200) {
        final users = (response.data['data'] as List)
            .map((user) => User.fromJson(user))
            .toList();
        return users;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
