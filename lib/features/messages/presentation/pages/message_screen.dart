import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/features/messages/presentation/widgets/messge_item_widget.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [CircleAvatar(), Space.x(10), Text("Name")],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: ListView(reverse: true, children: [
              MessageItem(
                isSender: false,
              ),
              MessageItem(
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
