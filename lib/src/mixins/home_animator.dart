import 'package:flutter/cupertino.dart';

class HomeAnimatorMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  Animation<double> flapAnimation;
  AnimationController flapController;

  Animation<double> boxAnimation;
  AnimationController boxController;

  initCatAnimation(TickerProvider vsync) {
    catController = AnimationController(
        duration: Duration(milliseconds: 200), vsync: vsync);
    catAnimation = Tween(begin: -35.0, end: -80.0).animate(
        CurvedAnimation(parent: catController, curve: Curves.easeInOut));
  }

  initFlapsAnimation(TickerProvider vsync) {
    flapController = AnimationController(
        duration: Duration(milliseconds: 300), vsync: vsync);
    flapAnimation = Tween(begin: 0.6, end: 0.55).animate(CurvedAnimation(
        parent: flapController,
        curve: Interval(0.4, 1, curve: Curves.easeInOut)));
    flapAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        flapController.reverse();
      }
    });
  }

  initBoxAnimation(TickerProvider vsync) {
    boxController = AnimationController(
        duration: Duration(milliseconds: 200), vsync: vsync);
    boxAnimation = Tween(begin: 0.0, end: 0.01).animate(CurvedAnimation(
        parent: boxController,
        curve: Interval(0.4, 1, curve: Curves.easeInOut)));
    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      }
    });
  }
}
