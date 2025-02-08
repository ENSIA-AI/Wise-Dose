// lib/views/widgets/message_bubble.dart
import 'package:flutter/material.dart';
import 'package:wise_dose/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: message.isUser 
              ? const Color.fromRGBO(33, 67, 83, 1) 
              : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: message.isUser ? const Radius.circular(20) : const Radius.circular(4),
            bottomRight: message.isUser ? const Radius.circular(4) : const Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: message.isUser ? Colors.white : Colors.black87,
                ),
                children: message.spans.map((span) {
                  // Preserve existing styles while ensuring color consistency
                  return TextSpan(
                    text: span.text,
                    style: span.style?.merge(
                      TextStyle(
                        color: span.style?.color ?? 
                            (message.isUser ? Colors.white : Colors.black87),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (message.isComplete || message.isUser) ...[
              const SizedBox(height: 4),
              Text(
                _formatTimestamp(message.timestamp),
                style: TextStyle(
                  color: message.isUser 
                      ? Colors.white.withOpacity(0.8)
                      : const Color(0xFF757575),
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}