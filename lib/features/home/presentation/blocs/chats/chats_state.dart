part of 'chats_cubit.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState({required List<Chat> chats}) = _Initial;
  factory ChatsState.initial() => ChatsState(chats: []);
}
