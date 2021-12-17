import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> buttonSqueeze;
  final Animation<double> buttonZooOut;

  StaggerAnimation({Key? key, required this.controller})
      : buttonSqueeze = Tween<double>(begin: 320.0, end: 60.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.150), // 0.3 segundos de 2 segundos
          ),
        ),
        buttonZooOut = Tween<double>(begin: 60, end: 1000).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1, curve: Curves.bounceOut),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueeze.value > 75) {
      return const Text(
        "Sign in",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      );
    } else {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
      );
    }
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      child: InkWell(
        onTap: () {
          controller.forward();
        },
        child: Hero(
          tag: "fade",
          child: buttonZooOut.value == 60
              ? Container(
                  width: buttonSqueeze.value,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(247, 64, 106, 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: _buildInside(context),
                )
              : Container(
                  width: buttonZooOut.value,
                  height: buttonZooOut.value,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(247, 64, 106, 1.0),
                    /*shape: buttonZooOut.value < 500
                      ? BoxShape.circle
                      : BoxShape.rectangle,*/
                    borderRadius: BorderRadius.all(
                      Radius.circular(buttonZooOut.value < 500 ? 30 : 0),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
