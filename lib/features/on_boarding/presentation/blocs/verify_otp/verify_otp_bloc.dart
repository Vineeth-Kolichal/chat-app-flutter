import 'package:chat_app/features/on_boarding/domain/usecase/verify_otp_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';
part 'verify_otp_bloc.freezed.dart';

@injectable
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  TextEditingController otpController = TextEditingController();
  VerifyOtpUseCase useCase;
  VerifyOtpBloc(this.useCase) : super(VerifyOtpState.initial()) {
    on<VerifyOtpEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true, isVerified: false, error: null));
      final resp = await useCase(Otp(otpController.text.trim(), event.phone));
      final newState = resp.fold((fail) {
        return state.copyWith(
            isLoading: false, error: fail.error, isVerified: false);
      }, (success) {
        return state.copyWith(isLoading: false, error: null, isVerified: true);
      });
      emit(newState);
    });
  }
}
