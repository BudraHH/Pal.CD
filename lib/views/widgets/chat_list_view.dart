import 'package:Pal/models/conversation.dart';
import 'package:flutter/material.dart';

import 'message_widget_demo.dart';

class ChatListView extends StatefulWidget {
  final List<Conversation> conversations;
  const ChatListView({super.key, required this.conversations});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: false,
      itemCount: widget.conversations.length,
      itemBuilder: (context, index) {
        Conversation conversation = widget.conversations[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MessageWidget(text: conversation.question),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            MessageWidget(text: conversation.answer, fromAi: true),
          ],
        );
      },
    );
  }
}
