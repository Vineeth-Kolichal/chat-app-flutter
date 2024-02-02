part of 'verify_otp_bloc.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState(
      {required bool isLoading,
      String? error,
      required bool isVerified}) = _Initial;
  factory VerifyOtpState.initial() =>
      const VerifyOtpState(isLoading: false, isVerified: false);
}
