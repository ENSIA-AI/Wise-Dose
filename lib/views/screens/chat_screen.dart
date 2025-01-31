// chat_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/chatbot/chat_bloc.dart';
import '../../database/chat_repository.dart';
import '../widgets/app_bar.dart';
import '../widgets/chat_input.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(
        RepositoryProvider.of<ChatRepository>(context),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
      preferredSize: const Size.fromHeight(100.0), // Set the height
      child: getAppBar(),
        ),
        body: Column(
          children: [
            Expanded(
              child: _buildMessagesList(),
            ),
            const ChatInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessagesList() {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return CustomScrollView(
          reverse: false,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (state is! ChatLoaded) return const SizedBox.shrink();
                    final messages = state.messages;
                    return MessageBubble(message: messages[index]);
                  },
                  childCount: state is ChatLoaded ? state.messages.length : 0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}