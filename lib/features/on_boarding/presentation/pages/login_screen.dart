import 'package:chat_app/common/widgets/common_elevated_button.dart';
import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/send_otp/send_otp_bloc.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final sendOtpBloc = context.read<SendOtpBloc>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.y(size.width * 0.3),
              SizedBox(
                width: size.width,
                child: Center(
                  child: Hero(
                    tag: "logo",
                    child: Image.asset('assets/images/whatsapp_logo.png',
                        scale: 4),
                  ),
                ),
              ),
              Space.y(size.width * 0.2),
              Text(
                "Enter your mobile number",
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                "Please confirm your contry code and enter your mobile number",
                style: theme.textTheme.bodyMedium,
              ),
              Space.y(10),
              Form(
                key: _formKey,
                child: IntlPhoneField(
                  validator: (p0) {
                    if (p0 == null ||
                        p0.completeNumber.isEmpty ||
                        p0.completeNumber.length < 13) {
                      return "Please enter complete phone number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(45)),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    sendOtpBloc.phone = phone.completeNumber;
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: BlocConsumer<SendOtpBloc, SendOtpState>(
                  listener: (context, state) {
                    if (state.error != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.error!),
                        backgroundColor: Colors.red,
                      ));
                    }
                    if (state.isOtpSend) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const OtpScreen(),
                      ));
                    }
                  },
                  builder: (context, state) {
                    return CommonElevatedButton(
                      isLoading: state.isLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            sendOtpBloc.phone != null) {
                          sendOtpBloc.add(const SendOtp());
                        }
                      },
                      label: "Send OTP",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
