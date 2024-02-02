part of 'send_otp_bloc.dart';

@freezed
class SendOtpState with _$SendOtpState {
  const factory SendOtpState({
    required bool isLoading,
    required bool isOtpSend,
    String? error,
  }) = _Initial;
  factory SendOtpState.initial() =>
      const SendOtpState(isLoading: false, isOtpSend: false);
}
