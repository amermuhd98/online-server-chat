import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aplication/screens/register.dart';
import 'package:flutter/material.dart';



import '../widget/my_button.dart';
import 'login.dart';


class HelloScreen extends StatefulWidget {
  static const String screenRoute = 'HelloScreen';
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(
      begin: Color.fromARGB(255, 250, 253, 255),
      end: Color.fromARGB(255, 250, 253, 255),
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                // tag: 'logo',
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Image.asset(
                    "images/Online world-pana.png",
                    height: 2,
                    width: 400,
                  ),
                ),

                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'دردشة من جميع ',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(195, 231, 83, 38),
                      ),
                    ),
                  ],
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'انحاء العالم',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(195, 231, 83, 38),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            MyButton(
              color: Color.fromARGB(195, 231, 83, 38),
              title: 'تسجيل الدخول',
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.screenRoute);
              },
            ),
            MyButton(
              color: Color.fromARGB(117, 255, 64, 128),
              title: 'انشاء حساب جديد',
              onPressed: () {
                Navigator.pushNamed(context, register.screenRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
