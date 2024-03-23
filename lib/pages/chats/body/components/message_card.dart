import 'package:ai_journey/models/user_chat.dart';
import 'package:flutter/material.dart';
import './../../../../models/user_chat.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);

    final color = message.sourceType == MessageSourceType.user
        ? Color(0xFF4588F1)
        : Color(0xFF394056);

    final alignment = message.sourceType == MessageSourceType.user
        ? MainAxisAlignment.end
        : MainAxisAlignment.start;

    final avatar = CircleAvatar(
      backgroundColor: color,
      child: Text(
        message.sourceType == MessageSourceType.user ? 'U' : 'M',
        style: textTheme.bodyLarge,
      ),
    );
    return Row(
      mainAxisAlignment: alignment,
      children: [
        if (message.sourceType == MessageSourceType.model) avatar,
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          constraints: BoxConstraints(maxWidth: size.width * 0.6),
          child: Text(
            message.content,
          ),
        ),
        if (message.sourceType == MessageSourceType.user) avatar,
      ],
    );
  }
}
