import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AnimatedBox extends StatefulWidget {
  final boxAnimation;
  final flapAnimation;

  AnimatedBox({@required this.boxAnimation, @required this.flapAnimation});

  @override
  State<StatefulWidget> createState() => BoxState(boxAnimation, flapAnimation);
}

class BoxState extends State<AnimatedBox> {
  Animation boxAnimation;
  Animation flapAnimation;

  Container _basePanel = Container(height: 10, width: 100, color: Colors.brown);
  Container _buildBox = Container(height: 200, width: 200, color: Colors.brown);

  BoxState(this.boxAnimation, this.flapAnimation);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: boxAnimation,
        child: _buildTotalBox(),
        builder: (content, child) {
          return Transform.rotate(
              angle: pi * boxAnimation.value, child: _buildTotalBox());
        });
  }

  Widget _buildTotalBox() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        _buildBox,
        _animateFlap(
            animationValue: -flapAnimation.value,
            position: Alignment.topRight,
            left: null,
            right: 0.5),
        _animateFlap(
            animationValue: flapAnimation.value,
            position: Alignment.topLeft,
            left: 0.5,
            right: null)
      ],
    );
  }

  Widget _animateFlap(
      {double animationValue, Alignment position, double left, double right}) {
    return AnimatedBuilder(
        animation: flapAnimation,
        child: _basePanel,
        builder: (context, child) {
          return _initLFlap(
              animationValue: animationValue,
              position: position,
              left: left,
              right: right);
        });
  }

  Positioned _initLFlap(
      {double animationValue, Alignment position, double left, double right}) {
    return Positioned(
        left: left,
        right: right,
        child: Transform.rotate(
            alignment: position,
            angle: pi * animationValue,
            child: _basePanel));
  }
}
