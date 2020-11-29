import 'package:animations/src/mixins/home_animator.dart';
import 'package:animations/src/widgets/animated_box.dart';
import 'package:animations/src/widgets/animated_cat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home>
    with TickerProviderStateMixin, HomeAnimatorMixin {
  @override
  void initState() {
    super.initState();

    initCatAnimation(this);
    initBoxAnimation(this);
    initFlapsAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: GestureDetector(
        onTap: _onTap,
        child: Center(
            child: Stack(overflow: Overflow.visible, children: [
          AnimatedCat(catAnimation),
          AnimatedBox(
            boxAnimation: boxAnimation,
            flapAnimation: flapAnimation,
          )
        ])),
      ),
    );
  }

  _onTap() {
    if (catController.status == AnimationStatus.completed) {
      flapController.forward();
      boxController.forward();
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      flapController.forward();
      boxController.forward();
      catController.forward();
    }
  }
}
