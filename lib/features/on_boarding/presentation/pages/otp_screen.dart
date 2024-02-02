import 'package:chat_app/common/widgets/common_elevated_button.dart';
import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/send_otp/send_otp_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/verify_otp/verify_otp_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/set_profile_screen.dart';
import 'package:chat_app/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

final _formKey = GlobalKey<FormState>();

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final sendOtp = context.read<SendOtpBloc>();
    final verifyOtp = context.read<VerifyOtpBloc>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: size.width,
                child: Center(
                  child: Hero(
                    tag: "logo",
                    child: Image.asset(
                      'assets/images/whatsapp_logo.png',
                      scale: 4,
                    ),
                  ),
                ),
              ),
              Space.y(size.width * 0.1),
              Text(
                "Enter OTP",
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Space.y(20),
              Form(
                key: _formKey,
                child: Pinput(
                  length: 6,
                  controller: verifyOtp.otpController,
                  //focusNode: focusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  validator: (value) {
                    if (value == null) {
                      return "Please enter OTP";
                    }
                    return null;
                  },
                  // onClipboardFound: (value) {
                  //   debugPrint('onClipboardFound: $value');
                  //   pinController.setText(value);
                  // },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  // onCompleted: (pin) {
                  //   debugPrint('onCompleted: $pin');
                  // },
                  // onChanged: (value) {
                  //   debugPrint('onChanged: $value');
                  // },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: Colors.blue.withOpacity(0.5),
                      ),
                    ],
                  ),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.blue),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(
                          color: const Color.fromARGB(255, 1, 58, 105)),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              Space.y(20),
              BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
                listener: (context, state) {
                  if (state.isVerified) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SetProfileScreen(),
                    ));
                  }
                  if (state.error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error!),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                builder: (context, state) {
                  return CommonElevatedButton(
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          verifyOtp.otpController.text.length == 6) {
                        final phone = sendOtp.phone;
                        verifyOtp.add(VerifyOtp(phone: phone!));
                      }
                    },
                    label: "Verify OTP",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
