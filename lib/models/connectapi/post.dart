import 'dart:convert';

class Posts {
  final String userId;
  final String postId;
  final String content;
  final String image;
  final String video;
  const Posts({
    required this.userId,
    required this.postId,
    required this.content,
    required this.image,
    required this.video,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('userId') &&
        json.containsKey('postId') &&
        json.containsKey('content')) {
      return Posts(
        userId: json['userId'],
        postId: json['postId'],
        content: json['content'],
        video: json['video'],
        image: json['image'],
      );
    } else {
      throw FormatException('Failed to load album.');
    }
  }
}
