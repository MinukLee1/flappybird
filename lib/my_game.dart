import 'dart:ui';

import 'package:flame/gestures.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/components/floor.dart';
import 'package:flappybird/components/pipe_set.dart';
import 'package:flappybird/components/titiles.dart';
import 'package:flappybird/game_State.dart';
import 'components/bird.dart';
import 'components/floor.dart';
import 'package:flame/components/component.dart';
import 'package:flappybird/main.dart';


class MyGame extends BaseGame with TapDetector {
  Bird _bird;
  Floor _floor;
  Titles _titles;
  Pipeset _pipeSet;

  MyGame(){
    _bird = Bird();
    _floor = Floor();
    _titles = Titles();
    _pipeSet = Pipeset();

    this
      ..add(
          SpriteComponent.fromSprite(size.width,size.height,Sprite("bg.png")))
      ..add(_bird)
      ..add(_pipeSet)
      ..add(_floor)
      ..add(_titles);

  }

  // 상황 업데이트 (현재 페이지)
  @override
  void update(double t) {
    super.update(t);

    if(checkIf2ItemCollision(_bird.toRect(),_floor.toRect())){
      print("Game Over !!");
      gameState = GameState.gameover;
    }


    // upper , down pipe와 collision시 gameover
    if(checkIf2ItemCollision(_bird.toRect(),_pipeSet.getPipeUpRect())){
      print("Game Over !!");
      gameState = GameState.gameover;
    }

    if(checkIf2ItemCollision(_bird.toRect(),_pipeSet.getPipeDownRect())){
      print("Game Over !!");
      gameState = GameState.gameover;
    }

    checkIfBirdPassedPipe();
  }

  //탭( 터치) 할떄 오버라이드
  @override
  void onTap() {
    _bird.onTap();
    switch(gameState){

      case GameState.pause:
        gameState = GameState.play;
        break;

      case GameState.play:
        break;

      case GameState.gameover:
        gameState = GameState.pause;
        break;
    }
  }

  bool checkIf2ItemCollision(Rect item1, Rect item2){
    var intersectedRect = item1.intersect(item2);
    //item1과 item2의 겹치는 직사각형에 대한 정의
    return intersectedRect.width > 2 && intersectedRect.height > 2;
  }

  // 새가 pipe를 지났는지 여부 메소드
  bool checkIfBirdPassedPipe(){

    if(_pipeSet.hasScored)
      return false;

    if(_pipeSet.getPipeUpRect().right < _bird.toRect().left ){
     print("Scored!");
     _pipeSet.scoreUpdated();
    }
  }
}
