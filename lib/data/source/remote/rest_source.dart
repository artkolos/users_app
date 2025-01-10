import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:users_app/domain/models/user/user.dart';

@singleton
class RestSource {
  RestSource._(this._dio);

  static const _timeout = 40;
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const _users = '/users';

  final Dio _dio;

  @factoryMethod
  static RestSource create() {
    final dio = Dio(
      BaseOptions(
        receiveTimeout: const Duration(seconds: _timeout),
        sendTimeout: const Duration(seconds: _timeout),
        connectTimeout: const Duration(seconds: _timeout),
        baseUrl: _baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return RestSource._(dio);
  }

  Future<List<User>> getUsers() async {
    final response = await _dio.get(_users);
    final data = (response.data as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final listUsers = data.map((e) => User.fromJson(e)).toList();
    return listUsers;
  }
}
