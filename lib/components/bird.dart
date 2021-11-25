import 'package:flame/anchor.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/flame.dart';

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
    speedY += GRAVITY * t;
    //시간 누적
    this.anchor = Anchor.center;
    //중력의 거리공식 사용하여 중력가속도 구현
    this.y += (speedY * t )/2;
    this.x = size.width/2;
  }


  void onTap(){
    this.speedY = -500;
    Flame.audio.play("bubble_pop.mp3",volume: 0.5);
  }
}