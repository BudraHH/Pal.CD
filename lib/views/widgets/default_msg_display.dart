import 'package:flutter/material.dart';
import 'package:Pal/models/conversation.dart';

import 'message_widget_demo.dart';

class DefaultMsgDisplay extends StatefulWidget {
  final List<Conversation> conversations;
  const DefaultMsgDisplay({super.key, required this.conversations});

  @override
  State<DefaultMsgDisplay> createState() => _DefaultMsgDisplayState();
}

class _DefaultMsgDisplayState extends State<DefaultMsgDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.conversations.length,
        itemBuilder: (context, index) {
          Conversation conversation = widget.conversations[index];
          return Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 12.5,
                  minRadius: 12.5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                MessageWidget(text: 'Hi, I am Pal', fromAi: true),
              ],
            ),
          ]);
        });
  }
}
