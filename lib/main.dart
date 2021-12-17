import 'package:flutter/material.dart';

import 'pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Animações Complexas",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
