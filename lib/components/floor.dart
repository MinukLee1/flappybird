import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/options.dart';

import '../game_State.dart';
import '../main.dart';

class Floor extends Component{

  Sprite _floorSprite = Sprite('floor.png');
  double xSize = 0;
  double ySize = 0;
  double xPos = 0;

  @override
  void render(Canvas c) {
    xSize = size.width *2;
    ySize = size.width / 168*56;
    _floorSprite.renderPosition(c, Position(xPos,size.height - ySize* 0.22),
        size:  Position(xSize, ySize ));
  }

  @override
  void update(double t) {

    switch(gameState){
//gamestate를 import 하여 각각의 case에 대해 설정 가능

    //게임 중지
      case GameState.pause:

        xPos -= t * (30+GAME_SPEED);
        if(xPos.abs() >= size.width) xPos = 0;
        break;

    // 게임 플레이
      case GameState.play:

        xPos -= t *  (30+GAME_SPEED);
        if(xPos.abs() >= size.width) xPos = 0;
        break;

    // 게임 오버
      case GameState.gameover:
        break;
    }

  }

  Rect toRect(){
    return Rect.fromLTWH(0, size.height - ySize* 0.22, xSize, ySize);
  }

}