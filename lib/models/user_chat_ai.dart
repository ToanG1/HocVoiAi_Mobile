import 'package:equatable/equatable.dart';

enum MessageAISourceType { user, model }

class MessageAI extends Equatable {
  final String id;
  final String content;
  final DateTime createdAt;

  const MessageAI({
    required this.id,
    required this.content,
    required this.createdAt,
  });

  MessageAI copyWith({
    String? id,
    String? content,
    //  MessageAISourceType? sourceType,
    DateTime? createdAt,
  }) {
    return MessageAI(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory MessageAI.fromJson(Map<String, dynamic> json, {String? id}) {
    return MessageAI(
      id: id ?? json['id'] ?? '',
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, content, createdAt];
}
