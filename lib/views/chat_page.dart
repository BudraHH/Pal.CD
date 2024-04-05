import 'dart:convert';

import 'package:Pal/models/conversation.dart';
import 'package:Pal/views/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'widgets/chat_list_view.dart';

Future<String> fetchData(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

class ChatPage extends StatefulWidget {
  final String question;

  const ChatPage({Key? key, required this.question}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];
  String url = "";
  String output = "basic response";
  bool isFirstExecution = true;

  Future<void> _makeHttpRequest(String question) async {
    url = 'http://10.0.2.2:5000/get_response?query=' + question.toString();
    try {
      String data = await fetchData(url);
      var response = jsonDecode(data);

      if (response != null) {
        output = response['response'];
        conversations.last = Conversation(conversations.last.question, output);
        setState(() {});
      } else {
        print('Failed to get response from the server.');
      }
    } catch (e) {
      print('Error making HTTP request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String question1 = widget.question;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.white),
        foregroundColor: Color(0xFF03203c),
        title: Text(
          'Pal.CD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Color(0xFF03203c),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .885,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //     height:
                          //         MediaQuery.of(context).size.height * 0.045),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: ChatListView(conversations: conversations),
                            ),
                          ),
                          ChatTextField(
                            controller: controller,
                            onSubmitted: (question) async {
                              url = 'http://10.0.2.2:5000/get_response?query=' +
                                  question.toString();
                              controller.clear();
                              FocusScope.of(context).unfocus();
                              conversations.add(Conversation(question!, ""));
                              isFirstExecution = false;

                              try {
                                String data = await fetchData(url);
                                var response = jsonDecode(data);

                                if (response != null) {
                                  output = response['response'];
                                  conversations.last = Conversation(
                                      conversations.last.question, output);
                                  setState(() {});
                                } else {
                                  print(
                                      'Failed to get response from the server.');
                                }
                              } catch (e) {
                                print('Error making HTTP request: $e');
                              }
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
