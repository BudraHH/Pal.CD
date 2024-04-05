import 'dart:async';

import 'package:Pal/views/home_page_demo.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds and then navigate to HomePage with a fade-in animation
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => HomePage(),
          transitionsBuilder: (context, animation1, animation2, child) {
            const begin = Offset(0.0, 0.0);
            const end = Offset(0, 0);
            const curve = Curves.easeOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            var offsetAnimation = animation1.drive(tween);

            // Add FadeTransition for the fade-in effect
            var fadeInAnimation =
                Tween(begin: 0.0, end: 1.0).animate(animation1);

            return FadeTransition(
              opacity: fadeInAnimation,
              child: SlideTransition(position: offsetAnimation, child: child),
            );
          },
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
      ),
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
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Center(
                  child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.095,
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: Image.asset('assets/images/pal_cd_logo.png'),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    "Pal.CD",
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
