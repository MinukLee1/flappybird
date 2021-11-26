import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/options.dart';

import '../main.dart';

class Pipeset extends Component{

  //파이프의 높이를 12개로 분할후 적용/사용
  // static : instance가 아직생성x여도 global값으로 생성
  static double pipeH = size.height / 12 * 7;
  static double pipeW = pipeH/160 * 26;
  // 위, 아래 파이프간 gap설정
  static double pipeGap = 4;

  Sprite _pipeUp = Sprite("pipe_up.png");
  Sprite _pipeDown = Sprite("pipe_down.png");

  double pipePos = size.width;
  // 기본 파이프 spawn 위치 : 1
  int pipeLevel = 1;

  @override
  void render(Canvas c) {
    _pipeUp.renderPosition(c,Position(pipePos, pipeH/7*(pipeLevel-7))
      , size: Position(pipeW, pipeH));

    //pipeLevel이 1일떄 gap 만큼 더해서 통로 생성
    _pipeDown.renderPosition(c,Position(pipePos, pipeH/7* (pipeLevel + pipeGap))
        , size: Position(pipeW, pipeH));
  }


  //파이프의 생성 메서드
  @override
  void update(double t) {
    //파이프의 가로길이만큼 작을시 .. -> 파이프가 한번다 화면에서 지나감(loop)
    if (pipePos < -pipeW) {
      pipePos = size.width;
      //랜덤 파이브 출력 : 1,2,3,4,5,6 칸까지 설정

      pipeLevel = Random().nextInt(5);
      if( pipeLevel == 0) pipeLevel = 6;
    }

    //게임 스피드 설정
    pipePos -= t * (30 + GAME_SPEED);
  }
}