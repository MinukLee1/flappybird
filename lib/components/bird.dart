import 'package:flame/anchor.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/flame.dart';
import 'package:flappybird/options.dart';

import '../game_State.dart';
import '../main.dart';

final double Bird_W = 52;
final double Bird_H = 36.7;
//중력의 거리공식 사용하여 중력가속도 구현
final double GRAVITY = 1200;


// RECT EXTNEDS . . 사용가능
class Bird extends AnimationComponent{
  // 가로 , 세로 , 이미지의경로 . .
  Bird()
  // 이미지를 어떤식으로 보여줄건지, 정보
      : super.sequenced(Bird_W, Bird_H,'bird.png', 3, textureWidth: 17, textureHeight: 12);

  //현재 속도
  double speedY = 0.0;

  @override
  void update(double t) {
    //애니메이션 이동
    super.update(t);

    this.anchor = Anchor.center;

    switch(gameState){
//gamestate를 import 하여 각각의 case에 대해 설정 가능

    //게임 중지
      case GameState.pause:
        this.y = size.height * 0.4;
        this.x = size.width/2;
        break;

    // 게임 플레이
      case GameState.play:
        speedY += (GRAVITY+ GAME_SPEED) * t;
        //시간 누적
        this.anchor = Anchor.center;
        //중력의 거리공식 사용하여 중력가속도 구현
        this.y += (speedY * t )/2;
        this.x = size.width/2;
        break;

    // 게임 오버
      case GameState.gameover:
        break;
    }
  }

  // 클릭 (탭) 메서드
  void onTap(){

    switch(gameState){

      case GameState.pause:
        this.speedY = -500;
        Flame.audio.play("bubble_pop.mp3",volume: 0.5);
        break;

      case GameState.play:
        this.speedY = -500;
        Flame.audio.play("bubble_pop.mp3",volume: 0.5);
        break;

      case GameState.gameover:
        break;
    }

  }
}