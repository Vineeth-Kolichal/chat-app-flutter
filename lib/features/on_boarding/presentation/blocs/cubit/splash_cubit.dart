import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  Socket socket;
  SplashCubit(this.socket) : super(SplashState.initial());
  Future<void> getNexRoute() async {
    initSocket();
    SharedPreferences shared = await SharedPreferences.getInstance();
    final token = shared.getString('token');
    final phone = shared.getString('phone');
    final profile = shared.getBool('profile');
    Future.delayed(const Duration(seconds: 3), () {
      if (token != null) {
        if (profile != null) {
          emit(state.copyWith(nextRoute: "chat"));
          print(DateTime.now().millisecondsSinceEpoch);
          Timer(const Duration(seconds: 1), () {
            socket.emit('chats', {"phone": phone});
          });
        } else {
          emit(state.copyWith(nextRoute: "setProfile"));
        }
      } else {
        emit(state.copyWith(nextRoute: "login"));
      }
    });
  }

  void initSocket() {
    socket.onConnect((_) {
      log('connected');
    });
  }
}
