// lib/blocs/chatbot/chat_event.dart
part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessage extends ChatEvent {
  final String message;
  const SendMessage(this.message);
}

class UpdateBotMessage extends ChatEvent {
  final int index;
  final List<TextSpan> spans;
  const UpdateBotMessage({required this.index, required this.spans});
}

class CompleteBotMessage extends ChatEvent {
  final int index;
  const CompleteBotMessage({required this.index});
}