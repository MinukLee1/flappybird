import 'dart:collection';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird/consts/sprite_dimentions.dart';

import '../main.dart';

class Score extends PositionComponent{

  static final double numW = size.width/20;
  static final double numH = numW/12 * 18;
  HashMap<String, Sprite> _digits;

  SpriteComponent _oneDigit;
  SpriteComponent _twoDigit;
  SpriteComponent _threeDigit;

  //점수 저장
  int _score = 0;

  Score()
      : _digits = HashMap.from({
    "0":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.zeroNumberX,
        y: SpritePosition.zeroNumberY),
    "1":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.firstNumberX,
        y: SpritePosition.firstNumberY),
    "2":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.secondNumberX,
        y: SpritePosition.secondNumberY),
    "3":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.thirdNumberX,
        y: SpritePosition.thirdNumberY),
    "4":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.fourthNumberX,
        y: SpritePosition.fourthNumberY),
    "5":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.fifthNumberX,
        y: SpritePosition.fifthNumberY),
    "6":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.sixthNumberX,
        y: SpritePosition.sixthNumberY),
    "7":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.sevenNumberX,
        y: SpritePosition.sevenNumberY),
    "8":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.eightNumberX,
        y: SpritePosition.eightNumberY),
    "9":Sprite.fromImage(spriteSheet,
        width: SpriteDimentions.numberWidth,
        height: SpriteDimentions.numberHeight,
        x: SpritePosition.ninethNumberX,
        y: SpritePosition.ninethNumberY),
  }){

    //각 점수 자리수
    _oneDigit = SpriteComponent.fromSprite(numW, numH, _digits["0"]);
    _twoDigit = SpriteComponent.fromSprite(numW, numH, _digits["0"]);
    _threeDigit = SpriteComponent.fromSprite(numW, numH, _digits["0"]);

    _oneDigit.x = numW * 8;
    _twoDigit.x = numW * 1.5;
    _threeDigit.x = numW * 1.5;

    _oneDigit.y = numH * 1.5;

  }

  void addScore(){
    _score++;
  }

  void resetScore(){
    _score = 0;
  }


  //실제 점수를 보여줄 부분
  @override
  void render(Canvas c) {
    String scoreInstr = _score.toString().padLeft(3, "0");
    _oneDigit.sprite = _digits[scoreInstr[0]];
    _twoDigit.sprite = _digits[scoreInstr[1]];
    _threeDigit.sprite = _digits[scoreInstr[2]];

    _oneDigit.render(c);
    _twoDigit.render(c);
    _threeDigit.render(c);
  }


}