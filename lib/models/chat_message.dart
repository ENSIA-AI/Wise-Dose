
import 'package:flutter/material.dart';

class ChatMessage {
  final List<TextSpan> spans;
  final bool isUser;
  final DateTime timestamp;
  final bool isComplete;

  ChatMessage({
    required this.spans,
    required this.isUser,
    required this.timestamp,
    required this.isComplete,
  });

  ChatMessage copyWith({
    List<TextSpan>? spans,
    bool? isComplete,
  }) {
    return ChatMessage(
      spans: spans ?? this.spans,
      isUser: isUser,
      timestamp: timestamp,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}