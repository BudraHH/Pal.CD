import 'package:Pal/models/conversation.dart';
import 'package:Pal/views/chat_page.dart';
import 'package:Pal/views/widgets/example_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'widgets/chat_list_view.dart';

Future<String> fetchData(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.body;
}

Route _createRoute(String question) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChatPage(question: question),
    transitionsBuilder: (context, animation1, animation2, child) {
      const begin = Offset(0.0, 0.0);
      const end = Offset(0, 0);
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation1.drive(tween);

      // Add FadeTransition for the fade-in effect
      var fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(animation1);

      return FadeTransition(
        opacity: fadeInAnimation,
        child: SlideTransition(position: offsetAnimation, child: child),
      );
    },
    transitionDuration: const Duration(seconds: 1),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];
  String url = "";
  String output = "basic response";

  bool get isConversationStarted => conversations.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,

      // appBar: AppBar(
      //   leading: D,
      //   backgroundColor: Color(0xFF03203c),
      //   shadowColor: Colors.transparent,
      //   elevation: 0
      // ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Color(0xFF03203c),
                    ],
                    begin: Alignment.center,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .95,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 38),
                        if (!isConversationStarted) ...[
                          const SizedBox(height: 24),
                          Text(
                            "Hi, I am your",
                            style: textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Pal",
                            style: textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '''Ask anything about Cloud Destinations,
                   get your answers''',
                            style: textTheme.bodyMedium,
                          ),
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // IconButton(
                                  //     onPressed: null,
                                  //     icon: Icon(Icons.wb_sunny_outlined)),
                                  // const SizedBox(height: 6),
                                  Text(
                                    "Examples",
                                    style: textTheme.titleMedium,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  const ExampleWidget(
                                      text: "“Why Cloud Destinations”"),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  const ExampleWidget(
                                      text:
                                          "“what services do cloud destinations offer?”"),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  const ExampleWidget(
                                      text:
                                          "“What is the vision of Cloud Destinations?”"),
                                ],
                              ),
                            ),
                          ),
                        ] else
                          Expanded(
                              child: Stack(
                            children: [
                              Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: ChatListView(
                                        conversations: conversations),
                                  ),
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 1,
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.8,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12))),
                            ],
                          )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.065,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(_createRoute(controller.text));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF03203c)
                                  .withOpacity(.9), // Change the button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Change the border radius
                              ),
                            ),
                            child: Text(
                              "Start chat",
                              style: textTheme.headlineMedium?.copyWith(
                                //fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
