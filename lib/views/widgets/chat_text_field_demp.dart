import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSubmitted;

  const ChatTextField(
      {Key? key, required this.controller, required this.onSubmitted});

  String getCurrentText() {
    return controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                //height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 20),
                  child: TextField(
                    style: TextStyle(
                        color: Color(0xFF03203c), fontWeight: FontWeight.w500),
                    controller: controller,
                    cursorColor: Color(0xFF03203c).withOpacity(0.7),
                    decoration: InputDecoration(
                        hintText: 'Type here...',
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                onPressed: () async {
                  onSubmitted(controller.text);
                },
                icon: Icon(Icons.send_outlined),
              ),
            )
          ],
        ));
  }
}
