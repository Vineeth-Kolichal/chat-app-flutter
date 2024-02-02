import 'package:chat_app/common/widgets/common_elevated_button.dart';
import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/features/home/presentation/pages/chat_screen.dart';
import 'package:chat_app/features/on_boarding/presentation/blocs/set_profile/set_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetProfileScreen extends StatelessWidget {
  const SetProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<SetProfileBloc, SetProfileState>(
                builder: (context, state) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(90),
                    onTap: () {
                      context.read<SetProfileBloc>().add(const PickImage());
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        backgroundImage: (state.image != null)
                            ? FileImage(state.image!)
                            : null,
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: (state.image == null)
                              ? const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 60,
                                  color: Colors.grey,
                                )
                              : null,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Space.y(20),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  labelText: "Your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                ),
              ),
              Space.y(20),
              CommonElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ));
                  },
                  label: "Submit"),
              Text(
                'By clicking submit, you are agreeing to all the terms and conditions of the chat app, thereby acknowledging\nyour consent to abide by the specified rules,\npolicies, and guidelines governing the\nuse of the platform',
                style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
