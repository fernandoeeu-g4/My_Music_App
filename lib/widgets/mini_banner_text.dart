import 'package:flutter/material.dart';

class MiniBannerText extends StatelessWidget {
  const MiniBannerText({
    Key key,
    @required EdgeInsets miniBannerMargin,
    @required double screenWidth,
    @required String bannerText,
    @required double textSize,
    double widthRatio,
  })  : _miniBannerMargin = miniBannerMargin,
        _screenWidth = screenWidth,
        _bannerText = bannerText,
        _textSize = textSize,
        _widthRatio = widthRatio,
        super(key: key);

  final EdgeInsets _miniBannerMargin;
  final double _screenWidth;
  final String _bannerText;
  final double _textSize;
  final double _widthRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _miniBannerMargin,
      width: _screenWidth / (_widthRatio != null ? _widthRatio : 1.7),
      child: Text(
        _bannerText,
        style: TextStyle(
          fontSize: _textSize,
          fontWeight: FontWeight.bold,
          height: 1
        ),
      ),
    );
  }
}