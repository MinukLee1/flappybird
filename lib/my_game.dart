import 'dart:ui';

import 'package:flame/gestures.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/components/floor.dart';
import 'components/bird.dart';
import 'components/floor.dart';
import 'package:flame/components/component.dart';
import 'package:flappybird/main.dart';

class MyGame extends BaseGame with TapDetector {
  Bird _bird;
  Floor _floor;

  MyGame(){
    _bird = Bird();
    _floor = Floor();

    this
      ..add(
          SpriteComponent.fromSprite(size.width,size.height,Sprite("bg.png")))
      ..add(_bird)
      ..add(_floor);
  }

  @override
  void update(double t) {
    super.update(t);

    if(checkIf2ItemCallision(_bird.toRect(),_floor.toRect())){
      print("Game Over !!");
    }
  }

  @override
  void onTap() {
    _bird.onTap();
  }

  bool checkIf2ItemCallision(Rect item1, Rect item2){
    var intersectedRect = item1.intersect(item2);
    //Bird와 Floor사이의 겹치는 직사각형에 대한 정의
    return intersectedRect.width > 2 && intersectedRect.height > 2;
  }

}
