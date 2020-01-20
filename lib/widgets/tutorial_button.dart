import 'package:flutter/material.dart';

class TutorialButton extends StatelessWidget {
  const TutorialButton({
    Key key,
    @required double screenWidth,
    @required String label,
    bool isDark,
  })  : _screenWidth = screenWidth,
        _label = label,
        _isDark = isDark,
        super(key: key);

  final double _screenWidth;
  final String _label;
  final bool _isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: _isDark ? Color(0xffFBF5F3) : Color(0xFF30363B),
      ),
      margin: EdgeInsets.all(15),
      width: _screenWidth,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _label,
            style: TextStyle(
              color: _isDark ? Color(0xff30363B) : Color(0xffFBF5F3),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
