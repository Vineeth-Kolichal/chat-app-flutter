import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  factory Failure.apiRequestFailure(String error) = ApiRequestFailure;
}
