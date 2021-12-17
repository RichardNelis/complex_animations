import 'package:complex_animations/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import 'widget/form_container.dart';
import 'widget/sign_up_button.dart';
import 'widget/stagger_animation.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.jpg"),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 70,
                        bottom: 32,
                      ),
                      child: Image.asset(
                        "images/tickicon.png",
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const FormContainer(),
                    const SignUpButton(),
                  ],
                ),
                StaggerAnimation(controller: _controller)
              ],
            )
          ],
        ),
      ),
    );
  }
}
