import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:chat_app/features/home/presentation/blocs/bloc/users_bloc.dart';
import 'package:chat_app/features/messages/presentation/pages/message_screen.dart';
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
          return ListView.separated(
              itemBuilder: (context, index) {
                final userEntity = state.users[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MessageScreen(
                        phone: userEntity.phoneNumber!,
                        imagePath: userEntity.imagePath!,
                        chatId: userEntity.chatId,
                        name: userEntity.contactName,
                      ),
                    ));
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "${ApiEndpoints.baseUrl}${userEntity.imagePath}"),
                  ),
                  title: Text("${userEntity.contactName}"),
                  subtitle: Text("${userEntity.phoneNumber}"),
                );
              },
              separatorBuilder: (context, index) => Space.y(10),
              itemCount: state.users.length);
        },
      ),
    );
  }
}
