import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Text(
          'voltar',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            // color: Color(0xFF30363B),
          ),
        ),
      ),
    );
  }
}
