import 'package:chat_app/core/base_usecase/base_usecase.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/home/domain/entities/chat_entity.dart';
import 'package:chat_app/features/home/domain/usecases/chat_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chats_state.dart';
part 'chats_cubit.freezed.dart';

@injectable
class ChatsCubit extends Cubit<ChatsState> {
  ChatUsecase usecase;

  ChatsCubit(this.usecase) : super(ChatsState.initial());
  void getChats() async {
    final resp = await usecase(NoParams());
    resp.fold((l) {
      print(l);
    }, (chatStream) {
      chatStream.listen((event) {
        print(event);
      });
    });
  }
}
