import 'package:flutter/material.dart';

import 'list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  const AnimatedListView({Key? key, required this.listSlidePosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: listGenerateData(),
    );
  }

  List<ListData> listGenerateData() {
    return List<ListData>.generate(10, (index) {
      return ListData(
        title: "Estudar Flutter $index",
        subTitle: "Todos os dias",
        image: const AssetImage("images/perfil.jpg"),
        margin: listSlidePosition.value * (index / 1),
      );
    });
  }
}
