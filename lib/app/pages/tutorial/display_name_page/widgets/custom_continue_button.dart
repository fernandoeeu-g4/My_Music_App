import 'package:flutter/material.dart';
import 'package:k_central_app/widgets/tutorial_button.dart';

class CustomContinueButton extends StatelessWidget {
  const CustomContinueButton({
    Key key,
    @required Function onTap,
    @required double screenWidth,
    bool isDark,
  })  : _screenWidth = screenWidth,
        _isDark = isDark,
        _onTap = onTap,
        super(key: key);

  final Function _onTap;
  final double _screenWidth;
  final bool _isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: TutorialButton(
        isDark: _isDark,
        screenWidth: _screenWidth / 2.5,
        label: 'Próximo',
      ),
    );
  }
}
