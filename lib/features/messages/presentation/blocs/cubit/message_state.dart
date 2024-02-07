part of 'message_cubit.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState(
      {required List<MsgItemModel> messages, String? error}) = _Initial;
  factory MessageState.initial() =>
      const MessageState(messages: [], error: null);
}
