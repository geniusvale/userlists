part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UsersDataInitial;
  const factory UserState.error() = UsersDataError;
  const factory UserState.success(List<User> data, bool isLoading) = UsersDataSuccess;
}
