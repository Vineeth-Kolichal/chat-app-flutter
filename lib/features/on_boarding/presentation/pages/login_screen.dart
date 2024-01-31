import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/features/on_boarding/presentation/pages/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
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
              IntlPhoneField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(45)),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OtpScreen(),
                    ));
                  },
                  child: Text(
                    "Send OTP",
                    style: theme.textTheme.labelLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
