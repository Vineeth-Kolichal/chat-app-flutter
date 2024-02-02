import 'package:chat_app/features/on_boarding/domain/usecase/send_otp_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';
part 'send_otp_bloc.freezed.dart';

@injectable
class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final SendOtpUsecase usecase;
  String? phone;
  SendOtpBloc(this.usecase) : super(SendOtpState.initial()) {
    on<SendOtpEvent>((event, emit) async {
      if (phone != null) {
        emit(state.copyWith(isLoading: true, isOtpSend: false, error: null));
        final resp = await usecase(Phone(phoneNumber: phone!));
        final newState = resp.fold((fail) {
          return state.copyWith(
              isLoading: false, error: fail.error, isOtpSend: false);
        }, (success) {
          return state.copyWith(isLoading: false, error: null, isOtpSend: true);
        });
        emit(newState);
      }
    });
  }
}
