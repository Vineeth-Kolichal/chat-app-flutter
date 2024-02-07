import 'package:chat_app/features/home/presentation/blocs/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          print(state.users[0].contactName);
          return ListView();
        },
      ),
    );
  }
}
