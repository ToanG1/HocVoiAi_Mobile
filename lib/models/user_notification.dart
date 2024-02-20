import 'dart:math';

import 'package:faker/faker.dart';
import 'package:quick_social/models/models.dart';

enum NotificationType { like, comment, follow }

class UserNotification {
  final NotificationType type;
  final String message;
  final DateTime dateTime;
  final bool isRead;

  const UserNotification({
    required this.type,
    required this.message,
    required this.dateTime,
    this.isRead = false,
  });

  // static List<UserNotification> dummyNotifications = List.generate(
  //   7,
  //   (index) {
  //     final faker = Faker();
  //     final type = NotificationType.values[Random().nextInt(2)];
  //     final user =
  //         User.dummyUsers[Random().nextInt(User.dummyUsers.length - 1)];

  //     return UserNotification(
  //       type: type,
  //       message: switch (type) {
  //         NotificationType.like => '${user.username} menyukai postingan anda',
  //         NotificationType.comment => '${user.username} membalas komentar anda',
  //         NotificationType.follow => '${user.username} mulai mengikuti anda',
  //       },
  //       dateTime: faker.date.dateTime(minYear: 2020, maxYear: 2023),
  //     );
  //   },
  // );
  static List<UserNotification> dummyNotifications = List.generate(
    7,
    (index) {
      final faker = Faker();
      final type = NotificationType.values[Random().nextInt(2)];
      final user =
          User.dummyUsers[Random().nextInt(User.dummyUsers.length - 1)];

      String message;
      switch (type) {
        case NotificationType.like:
          message = 'Ninh Ninh liked your post';
          break;
        case NotificationType.comment:
          message = 'Ninh Ninh commented on your post';
          //message = '${user.username} membalas komentar anda';
          break;
        case NotificationType.follow:
          message = 'Ninh Ninh has followed you';
          break;
      }

      return UserNotification(
        type: type,
        message: message,
        dateTime: faker.date.dateTime(minYear: 2020, maxYear: 2023),
      );
    },
  );

  UserNotification copyWith({
    NotificationType? type,
    String? message,
    DateTime? dateTime,
    bool? isRead,
  }) {
    return UserNotification(
      type: type ?? this.type,
      message: message ?? this.message,
      dateTime: dateTime ?? this.dateTime,
      isRead: isRead ?? this.isRead,
    );
  }
}
