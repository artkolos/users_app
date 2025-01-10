import 'package:injectable/injectable.dart';
import 'package:users_app/data/source/locale/sp_source.dart';
import 'package:users_app/data/source/remote/rest_source.dart';
import 'package:users_app/domain/models/user/user.dart';
import 'package:users_app/domain/repository/users_repository.dart';

@LazySingleton(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(
    this.restSource,
    this.spSource,
  );

  final RestSource restSource;
  final SpSource spSource;

  @override
  Future<List<User>> getUsers() async {
    final users = spSource.getUsers();
    if (users != null) {
      return users;
    } else {
      final users = await restSource.getUsers();
      await Future.delayed(const Duration(seconds: 2)); //Иммитация загрузки
      spSource.putUsers(users);
      return users;
    }
  }
}
