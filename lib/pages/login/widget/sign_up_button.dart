import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 160.0),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {},
        child: const Text(
          "Não possui uma conta? Cadastre-se!",
          textAlign: TextAlign.center,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
