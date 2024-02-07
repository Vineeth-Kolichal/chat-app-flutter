import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/features/home/domain/entities/all_users_entity.dart';
import 'package:chat_app/features/home/domain/usecases/get_all_users_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  GetAllUsersUsecase usecase;
  UsersBloc(this.usecase) : super(UsersState.initial()) {
    on<UsersEvent>((event, emit) async {
      final resp = await usecase(NoParams());
      final newState = resp.fold((fail) {
        return state.copyWith(error: fail.error);
      }, (userList) {
        return state.copyWith(users: userList, error: null);
      });
      emit(newState);
    });
  }
}
