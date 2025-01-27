import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_app/domain/models/address/address.dart';
import 'package:users_app/domain/models/company/company.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String username,
    required String email,
    required Address address,
    required String phone,
    required String website,
    required Company company,
  }) = _User;

  factory User.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UserFromJson(json);
}
