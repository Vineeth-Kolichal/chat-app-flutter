part of 'users_bloc.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState({required List<UserEntity> users, String? error}) = _Initial;
 factory UsersState.initial() =>const UsersState(users: []);
}
