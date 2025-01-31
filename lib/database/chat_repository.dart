import 'package:google_generative_ai/google_generative_ai.dart';

class ChatRepository {
  final GenerativeModel _model;
  late ChatSession _chat;

  ChatRepository({required String apiKey})
      : _model = GenerativeModel(
          model: 'gemini-pro',
          apiKey: apiKey,
        ) {
    _initializeChat();
  }

  void _initializeChat() {
    _chat = _model.startChat();
  }

  Future<String> sendMessage(String message) async {
    try {
      final response = await _chat.sendMessage(Content.text(message));
      if (response.text == null) {
        throw Exception('Empty response received from Gemini');
      }
      return response.text!;
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }
}