import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/features/messages/presentation/pages/message_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MessageScreen(),
              ));
            },
            leading: CircleAvatar(),
            title: Text("Name"),
            trailing: Text("time"),
          );
        },
        separatorBuilder: (context, index) => Space.y(5),
        itemCount: 20,
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.chat)),
    );
  }
}
