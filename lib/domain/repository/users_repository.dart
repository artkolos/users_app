import 'package:users_app/domain/models/user/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}
