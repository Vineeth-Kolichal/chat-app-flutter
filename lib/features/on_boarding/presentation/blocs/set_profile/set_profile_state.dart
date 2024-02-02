part of 'set_profile_bloc.dart';

@freezed
class SetProfileState with _$SetProfileState {
  const factory SetProfileState({
    File? image,
    required bool isLoading,
    String? error,
    required bool isSuccess,
  }) = _Initial;
  factory SetProfileState.initial() =>
      SetProfileState(isLoading: false, isSuccess: false);
}
