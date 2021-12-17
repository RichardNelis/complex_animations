import 'package:flutter/material.dart';

import 'animated_listview.dart';
import 'fade_container.dart';
import 'home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color?> fadeAnimation;

  StaggerAnimation({Key? key, required this.controller})
      : containerGrow = CurvedAnimation(parent: controller, curve: Curves.ease),
        listSlidePosition = EdgeInsetsTween(
          begin: const EdgeInsets.only(top: 0),
          end: const EdgeInsets.only(top: 80),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.325, 0.8, curve: Curves.ease),
          ),
        ),
        fadeAnimation = ColorTween(
          begin: const Color.fromRGBO(247, 64, 160, 1.0),
          end: const Color.fromRGBO(247, 64, 160, 0.0),
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeInOut),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: _buildAnimation,
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            HomeTop(containerGrow: containerGrow),
            AnimatedListView(listSlidePosition: listSlidePosition),
          ],
        ),
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation,
          ),
        )
      ],
    );
  }
}
