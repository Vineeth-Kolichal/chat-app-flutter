import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:chat_app/features/home/presentation/blocs/bloc/users_bloc.dart';
import 'package:chat_app/features/home/presentation/blocs/chats/chats_cubit.dart';
import 'package:chat_app/features/home/presentation/pages/contacts_screen.dart';
import 'package:chat_app/features/messages/presentation/blocs/message_cubit/message_cubit.dart';
import 'package:chat_app/features/messages/presentation/pages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context
                      .read<MessageCubit>()
                      .getIntialMessages("${state.chats[index].id}");
                  context
                      .read<MessageCubit>()
                      .getMessages(state.chats[index].id);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MessageScreen(
                      chatId: state.chats[index].id,
                      phone: state.chats[index].phoneNumber!,
                      imagePath: state.chats[index].imagePath!,
                      name: state.chats[index].cName,
                    ),
                  ));
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "${ApiEndpoints.baseUrl}${state.chats[index].imagePath}"),
                ),
                title: Text(
                  "${(state.chats[index].cName == null) ? state.chats[index].phoneNumber : state.chats[index].cName}",
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${state.chats[index].lastMsg}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Text(DateFormat('hh:mm a')
                    .format(state.chats[index].lastMsgDate!)
                    .toLowerCase()),
              );
            },
            separatorBuilder: (context, index) => Space.y(5),
            itemCount: state.chats.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<UsersBloc>().add(GetUsers());
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ContactsScreen(),
            ));
          },
          child: Icon(Icons.chat)),
    );
  }
}
