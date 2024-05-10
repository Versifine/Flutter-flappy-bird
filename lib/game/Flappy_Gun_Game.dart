
import 'package:flutter/src/material/colors.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flappy_gun_game/components/background.dart';
import 'package:flappy_gun_game/components/ground.dart';
import 'package:flappy_gun_game/components/gun.dart';
import 'package:flappy_gun_game/components/ice_group.dart';
import 'package:flame/timer.dart';
import 'package:flappy_gun_game/game/comfiguration.dart';
import 'package:flappy_gun_game/game/gun_movement.dart';

class FlappyGunGame extends FlameGame with TapDetector,HasCollisionDetection{
  FlappyGunGame();

  late Gun gun;
  late TextComponent score;
  Timer interval = Timer(Config.iceInterval,repeat: true);
  bool isHit =false;
  GunSex sex = GunSex.female;

  @override
  Future<void> onLoad() async{
    addAll([
      Background(),
      Ground(),
      gun = Gun(Sex: sex),
      score = buildScore(),
    ]);
    interval.onTick =() => add(IceGroup());
  }

  TextComponent buildScore(){
    return TextComponent(
      text: 'Score: 0',
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: 35,
          color: Colors.greenAccent,
          backgroundColor: Colors.black26,

        )
      ),
      position: Vector2(size.x/2, size.y/2*0.2),
      anchor: Anchor.center,
    );

  }

  @override
  void onTap(){
    super.onTap();
    gun.fly();
  }

  @override
  void update(double dt){
    super.update(dt);
    interval.update(dt);

    score.text ='Score: ${gun.score}';
  }

}