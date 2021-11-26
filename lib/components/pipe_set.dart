import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/sprite.dart';

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


  @override
  void render(Canvas c) {
    _pipeUp.renderPosition(c,Position(size.width/2, pipeH/7*-6)
      , size: Position(pipeW, pipeH));
    _pipeDown.renderPosition(c,Position(size.width/2, pipeH/7*5)
        , size: Position(pipeW, pipeH));
  }


  //파이프의 생성 메서드
  @override
  void update(double t) {
    //파이프의 가로길이만큼 작을시 .. -> 파이프가 한번다 화면에서 지나감(loop)
    if (pipePos < -pipeW) {
      pipePos = size.width;
    }
    pipePos -= t * 50;
  }
}