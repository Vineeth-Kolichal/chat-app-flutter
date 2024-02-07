import 'package:chat_app/common/widgets/space.dart';
import 'package:chat_app/features/messages/data/models/messages_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageItem extends StatelessWidget {
  const MessageItem(
      {super.key,
      required this.isSender,
      required this.imagePath,
      required this.msgItemModel});
  final bool isSender;
  final String imagePath;
  final MsgItemModel msgItemModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isSender)
              CircleAvatar(
                backgroundImage: NetworkImage(imagePath),
                radius: 15,
              ),
            Space.x(5),
            Container(
              constraints: BoxConstraints(maxWidth: size.width * 0.8),
              decoration: BoxDecoration(
                color: isSender
                    ? const Color.fromARGB(255, 241, 241, 241)
                    : Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                "${msgItemModel.message}",
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: isSender ? null : Colors.white),
              ),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Space.x(35),
            Text(
              DateFormat('hh:mm a')
                  .format(msgItemModel.dateTime!)
                  .toLowerCase(),
              style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
