import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/features/home/presentation/pages/contacts_screen.dart';
import 'package:chat_app/features/messages/presentation/pages/message_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
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
            title: Text(
              "Name",
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("last msg"),
            trailing: Text("05:30 pm"),
          );
        },
        separatorBuilder: (context, index) => Space.y(5),
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ContactsScreen(),
            ));
          },
          child: Icon(Icons.chat)),
    );
  }
}
