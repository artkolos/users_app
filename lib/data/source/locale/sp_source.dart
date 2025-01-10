import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_app/domain/models/user/user.dart';

@preResolve
@singleton
class SpSource {
  SpSource._(this._sharedPreferences);

  static const _usersKey = 'users';

  final SharedPreferences _sharedPreferences;

  @factoryMethod
  static Future<SpSource> create() async {
    final sharedPreference = await SharedPreferences.getInstance();
    return SpSource._(sharedPreference);
  }

  List<User>? getUsers() {
    final usersStr = _sharedPreferences.getStringList(_usersKey);
    final users = usersStr
        ?.map((e) => jsonDecode(e))
        .map(
          (e) => User.fromJson(e),
        )
        .toList();
    return users;
  }

  void putUsers(List<User> users) {
    final usersMap = users.map((e) => e.toJson());
    final usersStr = usersMap.map((e) => jsonEncode(e)).toList();
    _sharedPreferences.setStringList(_usersKey, usersStr);
  }
}
