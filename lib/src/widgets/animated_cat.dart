import 'package:animations/src/widgets/cat.dart';
import 'package:flutter/cupertino.dart';

class AnimatedCat extends StatefulWidget {
  final _catAnimation;
  AnimatedCat(this._catAnimation);

  @override
  State<StatefulWidget> createState() => CatState(_catAnimation);
}

class CatState extends State<AnimatedCat> {
  Animation _catAnimation;

  CatState(this._catAnimation);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _catAnimation,
        child: Cat(),
        builder: (context, child) {
          //qua faccio piccole modifiche a child senza ricrealto da 0 a 60Hz
          return Positioned(
              //ricreo il container tutte le volte ma cat no
              child: child,
              right: 0.0,
              left: 0.0,
              top: _catAnimation.value);
        });
  }
}
