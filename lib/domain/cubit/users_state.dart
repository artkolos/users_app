part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initital;

  const factory UsersState.loading() = _Loading;

  const factory UsersState.error({required Exception exception}) = _Error;

  const factory UsersState.success({required List<User> users}) = _Success;
}
