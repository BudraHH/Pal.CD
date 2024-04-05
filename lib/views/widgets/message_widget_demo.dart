import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool fromAi;

  const MessageWidget({Key? key, required this.text, this.fromAi = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: fromAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            decoration: BoxDecoration(
              color: fromAi
                  ? Colors.white.withOpacity(0.8)
                  : Colors.white.withOpacity(0.99),
              borderRadius: BorderRadius.circular(20).copyWith(
                topLeft: fromAi ? const Radius.circular(0) : null,
                bottomRight: !fromAi ? const Radius.circular(0) : null,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ),
          if (fromAi) ...[
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            // Additional UI elements for AI messages if needed
          ]
        ],
      ),
    );
  }
}

void main() async {
  final process = await Process.start(
    'python',
    ['path/to/pythonfile1.py'],
  );

  late String outputString;

  process.stdout.transform(utf8.decoder).listen((data) {
    // Handle data received from Python
    outputString = data;
  });

  // Handle any errors from Python
  process.stderr.transform(utf8.decoder).listen((data) {
    print('Error from Python: $data');
  });

  // Wait for the Python process to complete
  final exitCode = await process.exitCode;

  // Create and display the MessageWidget with the received text
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: MessageWidget(
            text: outputString,
            fromAi: true,
          ),
        ),
      ),
    ),
  );
}
