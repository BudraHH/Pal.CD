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
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.73,
            //height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity((0.2)),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 15, top: 4, bottom: 4, end: 15),
              child: //const SizedBox(width: 8),
                  Flexible(
                child: TextField(
                  controller: controller,
                  autofillHints: Characters('string'),
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Type something..',
                      hintStyle: TextStyle(fontWeight: FontWeight.w100)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Container(
              //width: MediaQuery.of(context).size.width * 0.025,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(100)),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: IconButton(
                    onPressed: () async {
                      onSubmitted(controller.text);
                    },
                    icon: Icon(Icons.send_rounded, color: Colors.white),
                  ),
                ),
              ))
        ],
        // decoration: BoxDecoration(
        //     color: Colors.teal.shade900.withOpacity(0.2),
        //     borderRadius: BorderRadius.circular(12),
        //     border: Border.all(color: Colors.white, width: .8)),
      ),
    );
  }
}
