part of 'set_profile_bloc.dart';

@freezed
class SetProfileEvent with _$SetProfileEvent {
  const factory SetProfileEvent.pickImage() = PickImage;
  const factory SetProfileEvent.submit() = Submit;
}
