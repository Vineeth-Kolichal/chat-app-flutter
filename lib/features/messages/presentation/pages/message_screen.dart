import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/core/api_endpoints/api_endpoints.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:chat_app/features/messages/presentation/widgets/messge_item_widget.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key, required this.chat});
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
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
            child: ListView(reverse: true, children: [
              MessageItem(
                imagePath: "${ApiEndpoints.baseUrl}${chat.imagePath}",
                isSender: false,
              ),
              MessageItem(
                imagePath: "${ApiEndpoints.baseUrl}${chat.imagePath}",
                isSender: true,
              )
            ]),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
                onPressed: () {},
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
