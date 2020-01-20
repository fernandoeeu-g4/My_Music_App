import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    Key key,
    @required double screenWidth,
    @required onTap,
    bool loading = false,
  }) : _screenWidth = screenWidth, _onTap = onTap, _loading = loading;

  final double _screenWidth;
  final bool _loading;
  final _onTap;

  @override
  Widget build(BuildContext context) {
    final Widget svgIcon = SvgPicture.asset(
      'assets/icons/icons8-google.svg',
      semanticsLabel: 'Google',
      height: _screenWidth / 6.70 / 1.86,
      width: _screenWidth / 6.70 / 1.86,
    );
    // final double _screenWidth = MediaQuery.of(context).size.width;
    // final double _screenHeight = MediaQuery.of(context).size.height;
    return AbsorbPointer(
      absorbing: _loading,
          child: GestureDetector(
        onTap: _onTap,
            child: Container(
          width: _screenWidth / 1.60,
          height: _screenWidth / 6.70 + 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0xff4285F4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(left: 2),
                width: _screenWidth / 6.70,
                // width: 58.35,
                height: _screenWidth / 6.70,
                child: Padding(
                  padding: EdgeInsets.all(_screenWidth / 6.70 / 6),
                  child: svgIcon,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
