import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;

  const InputField(
      {Key? key, required this.hint, required this.icon, required this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 30, right: 30, bottom: 30, left: 5),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          border: InputBorder.none,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        obscureText: obscure,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white24,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
