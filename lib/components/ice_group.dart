import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_gun_game/game/Flappy_Gun_Game.dart';
import 'package:flappy_gun_game/game/comfiguration.dart';
import 'package:flappy_gun_game/game/ice_position.dart';
import 'package:flappy_gun_game/components/ice.dart';
import 'package:flutter/cupertino.dart';

class IceGroup extends PositionComponent with HasGameRef<FlappyGunGame>{
  IceGroup();

  final _random = Random();
  bool isAdded = false;

  @override
  Future<void> onLoad() async{
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 150+ _random.nextDouble() * heightMinusGround/4;
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing)*0.70;
    addAll([
      Ice(icePosition: IcePosition.top, height: centerY-spacing/2),
      Ice(icePosition: IcePosition.bottom,
          height: heightMinusGround-(centerY+spacing/2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if(position.x<Config.gunX&&!isAdded){
      updateScore();
      isAdded = true;
    }

    if(position.x < -60) {
      removeFromParent();
      debugPrint('Ice Removed');
    }
    if(gameRef.isHit){
      removeFromParent();
      gameRef.isHit=false;
    }

  }

  void updateScore(){
    gameRef.gun.score += 1;
  }

}