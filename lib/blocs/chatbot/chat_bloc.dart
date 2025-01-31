// lib/blocs/chatbot/chat_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../database/chat_repository.dart';
import '../../models/chat_message.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _repository;
  final List<ChatMessage> _messages = [];
  Timer? _typingTimer;
  List<TextSpan> _responseSpans = [];
  int _currentSpanIndex = 0;
  int _currentCharIndex = 0;

  ChatBloc(this._repository) : super(ChatInitial()) {
    on<SendMessage>(_onSendMessage);
    on<UpdateBotMessage>(_onUpdateBotMessage);
    on<CompleteBotMessage>(_onCompleteBotMessage);
  }

  Future<void> _onSendMessage(SendMessage event, Emitter<ChatState> emit) async {
    if (event.message.isEmpty) return;

    // Add user message
    _messages.add(ChatMessage(
      spans: [TextSpan(text: event.message)],
      isUser: true,
      timestamp: DateTime.now(),
      isComplete: true,
    ));
    emit(ChatLoaded(List.from(_messages)));

    try {
      // Get AI response
      final response = await _repository.sendMessage(event.message);
      _responseSpans = _parseResponse(response);
      
      // Add initial bot message placeholder
      _messages.add(ChatMessage(
        spans: [],
        isUser: false,
        timestamp: DateTime.now(),
        isComplete: false,
      ));
      emit(ChatLoaded(List.from(_messages)));

      // Start typing animation
      _currentSpanIndex = 0;
      _currentCharIndex = 0;
      _typingTimer?.cancel();
      _typingTimer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
        if (_currentSpanIndex < _responseSpans.length) {
          final currentSpan = _responseSpans[_currentSpanIndex];
          final currentText = currentSpan.text!;
          
          if (_currentCharIndex < currentText.length) {
            final newSpans = List<TextSpan>.from(_messages.last.spans);
            
            if (newSpans.length <= _currentSpanIndex) {
              newSpans.add(TextSpan(
                text: currentText[_currentCharIndex],
                style: currentSpan.style,
              ));
            } else {
              newSpans[_currentSpanIndex] = TextSpan(
                text: '${newSpans[_currentSpanIndex].text}${currentText[_currentCharIndex]}',
                style: currentSpan.style,
              );
            }
            
            _currentCharIndex++;
            add(UpdateBotMessage(
              index: _messages.length - 1,
              spans: newSpans,
            ));
          } else {
            _currentSpanIndex++;
            _currentCharIndex = 0;
          }
        } else {
          add(CompleteBotMessage(index: _messages.length - 1));
          timer.cancel();
        }
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void _onUpdateBotMessage(UpdateBotMessage event, Emitter<ChatState> emit) {
    _messages[event.index] = _messages[event.index].copyWith(spans: event.spans);
    emit(ChatLoaded(List.from(_messages)));
  }

  void _onCompleteBotMessage(CompleteBotMessage event, Emitter<ChatState> emit) {
    _messages[event.index] = _messages[event.index].copyWith(isComplete: true);
    emit(ChatLoaded(List.from(_messages)));
  }

  List<TextSpan> _parseResponse(String response) {
    List<TextSpan> spans = [];
    String buffer = response;

    // Parse color tags
    final colorRegex = RegExp(r'\[color:(\w+)\]\((.*?)\)');
    final colorMatches = colorRegex.allMatches(buffer);
    
    int lastEnd = 0;
    for (final match in colorMatches) {
      if (match.start > lastEnd) {
        spans.add(_createTextSpan(buffer.substring(lastEnd, match.start)));
      }
      
      final color = _getColorFromName(match.group(1)!);
      spans.add(TextSpan(
        text: match.group(2),
        style: TextStyle(color: color),
      ));
      
      lastEnd = match.end;
      buffer = buffer.replaceRange(match.start, match.end, '');
    }

    // Parse bold and italics
    final styleRegex = RegExp(r'(\*\*|\*)(.*?)\1');
    final styleMatches = styleRegex.allMatches(buffer);
    
    lastEnd = 0;
    for (final match in styleMatches) {
      if (match.start > lastEnd) {
        spans.add(_createTextSpan(buffer.substring(lastEnd, match.start)));
      }
      
      final style = match.group(1) == '**' 
          ? const TextStyle(fontWeight: FontWeight.bold)
          : const TextStyle(fontStyle: FontStyle.italic);
      
      spans.add(TextSpan(
        text: match.group(2),
        style: style,
      ));
      
      lastEnd = match.end;
    }

    // Add remaining text
    if (lastEnd < buffer.length) {
      spans.add(_createTextSpan(buffer.substring(lastEnd)));
    }

    return spans;
  }

  TextSpan _createTextSpan(String text) {
    return TextSpan(
      text: text,
      style: const TextStyle(color: Colors.black87),
    );
  }

  Color _getColorFromName(String name) {
    switch (name.toLowerCase()) {
      case 'red': return Colors.red[700]!;
      case 'blue': return Colors.blue[700]!;
      case 'green': return Colors.green[700]!;
      case 'orange': return Colors.orange[700]!;
      case 'purple': return Colors.purple[700]!;
      default: return Colors.black87;
    }
  }

  @override
  Future<void> close() {
    _typingTimer?.cancel();
    return super.close();
  }
}