import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/messages/presentation/blocs/message_cubit/message_cubit.dart';
import 'package:chat_app/features/messages/presentation/widgets/messge_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen(
      {super.key,
      this.chatId,
      this.name,
      required this.phone,
      required this.imagePath});

  final String? chatId;
  final String? name;
  final String phone;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (chatId != null) {
        context.read<MessageCubit>().getMessages(chatId!);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage("${ApiEndpoints.baseUrl}$imagePath"),
            ),
            Space.x(10),
            Text("${(name == null) ? phone : name}")
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: BlocBuilder<MessageCubit, MessageState>(
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  itemBuilder: (context, index) => MessageItem(
                    msgItemModel: state.messages[index],
                    imagePath: "${ApiEndpoints.baseUrl}$imagePath",
                    isSender: (state.messages[index].sender ==
                        state.messages[index].phoneNum),
                  ),
                  itemCount: state.messages.length,
                );
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
                  context.read<MessageCubit>().sendMessage(
                        chatId: chatId,
                        user2: phone,
                      );
                },
                icon: const Icon(
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
