import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/messages/presentation/blocs/cubit/message_cubit.dart';
import 'package:chat_app/features/messages/presentation/widgets/messge_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key, required this.chat});
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MessageCubit>().getMessages(chat.id!);
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage("${ApiEndpoints.baseUrl}${chat.imagePath}"),
            ),
            Space.x(10),
            Text("${chat.name}")
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: BlocBuilder<MessageCubit, MessageState>(
              builder: (context, state) {
                for (var x in state.messages) {
                  print(x.phoneNum);
                }
                return ListView.builder(
                    reverse: true,
                    itemBuilder: (context, index) => MessageItem(
                          msgItemModel: state.messages[index],
                          imagePath: "${ApiEndpoints.baseUrl}${chat.imagePath}",
                          isSender: (state.messages[index].sender ==
                              state.messages[index].phoneNum),
                        ),
                    itemCount: state.messages.length);
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: context.read<MessageCubit>().msgController,
                  decoration: InputDecoration(
                    hintText: "Message",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context
                      .read<MessageCubit>()
                      .sendMessage(chatId: chat.id!, user2: chat.phoneNumber!);
                },
                icon: Icon(
                  Icons.send,
                  size: 35,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
