import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:userlists/repositories/user_repo.dart';

import '../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UsersDataInitial()) {
    on<Started>(onUserInitial);
    on<Refresh>(onUserRefresh);
    on<Logout>(onUserLogout);
  }

  void onUserInitial(event, emit) async {
    try {
      final List<User>? usersList = await UserRepository().fetchUsersData();
      emit(UsersDataSuccess(usersList!, false));
    } catch (e) {
      emit(const UsersDataError());
      print(e.toString());
    }
  }

  Future<void> onUserRefresh(event, emit) async {
    emit(const UsersDataInitial());
    try {
      final List<User>? usersList = await UserRepository().fetchUsersData();
      emit(UsersDataSuccess(usersList!, false));
    } catch (e) {
      emit(const UsersDataError());
      print(e.toString());
    }
  }

  void onUserLogout(event, emit) {
    emit(const UsersDataInitial());
  }
}
