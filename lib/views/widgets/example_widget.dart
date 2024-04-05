import 'package:flutter/material.dart';
import 'package:Pal/views/chat_page.dart';

Route _createRoute(String text) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        ChatPage(question: text),
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

class ExampleWidget extends StatelessWidget {
  final String text;

  const ExampleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        //height: MediaQuery.of(context).size.height * 0.065,
        width: MediaQuery.of(context).size.width * 0.75,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute(text));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF03203c).withOpacity(0.2), // Change the button color
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25), // Change the border radius
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 18,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );

    // Container(
    //   width: double.infinity,
    //   margin: const EdgeInsets.only(bottom: 16),
    //   decoration: BoxDecoration(
    //     color: CustomColors.darkGrey,
    //     borderRadius: BorderRadius.circular(10)
    //   ),
    //   padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
    //   child: Text(text, style: textTheme.bodyLarge, textAlign: TextAlign.center),
    // );
  }
}
