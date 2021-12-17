import 'package:flutter/material.dart';

class CategorySelect extends StatefulWidget {
  const CategorySelect({Key? key}) : super(key: key);

  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  final List<String> _categories = ["Trabalho", "Estudos", "Casa"];

  int _category = 0;

  void selectForward() {
    setState(() {
      _category++;
    });
  }

  void selectBack() {
    setState(() {
      _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: _category > 0 ? selectBack : null,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.white,
          disabledColor: Colors.white30,
        ),
        Text(
          _categories[_category].toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed:
              _category < (_categories.length - 1) ? selectForward : null,
          icon: const Icon(
            Icons.arrow_forward_ios,
          ),
          color: Colors.white,
          disabledColor: Colors.white30,
        ),
      ],
    );
  }
}
