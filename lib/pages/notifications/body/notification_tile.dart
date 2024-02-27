import 'package:flutter/material.dart';
import 'package:ai_journey/models/models.dart';

class NotificationTile extends StatefulWidget {
  const NotificationTile({
    super.key,
    required this.notification,
  });

  final UserNotification notification;

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  late UserNotification _notification;

  @override
  void initState() {
    super.initState();
    _notification = widget.notification;
  }

  @override
  void didUpdateWidget(covariant NotificationTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    _notification = widget.notification;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final DateTime dateTime = widget.notification.dateTime;

    return ListTile(
      onTap: () => setState(() {
        _notification = _notification.copyWith(isRead: true);
      }),
      leading: Icon(
        widget.notification.type == NotificationType.like
            ? Icons.favorite
            : widget.notification.type == NotificationType.comment
                ? Icons.chat_bubble
                : widget.notification.type == NotificationType.follow
                    ? Icons.person_add
                    : Icons
                        .error, // Default icon in case none of the types match
        color: _notification.isRead
            ? theme.disabledColor
            : theme.colorScheme.primary,
      ),
      title: Text(
        widget.notification.message,
        style: TextStyle(
          color: _notification.isRead
              ? theme.colorScheme.onSurface.withAlpha(150)
              : null,
        ),
      ),
      subtitle: Text(
        '${dateTime.day}/${dateTime.month}/${dateTime.year}',
        style: TextStyle(color: theme.disabledColor),
      ),
      trailing: _notification.isRead
          ? null
          : Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
    );
  }
}
