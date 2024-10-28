import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
export 'package:flame/src/effects/scale_effect.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_gun_game/game/Flappy_Gun_Game.dart';
import 'package:flappy_gun_game/game/assets.dart';
import 'package:flappy_gun_game/game/comfiguration.dart';
import 'package:flappy_gun_game/game/gun_movement.dart';
import 'package:flutter/cupertino.dart';


class Gun extends SpriteGroupComponent<GunMovement>
    with HasGameRef<FlappyGunGame>,CollisionCallbacks{
  Gun({required this.Sex});
  GunSex Sex;
  int score =0;
  bool isLaughed =false;

  @override
  Future<void> onLoad() async {


    final gunMidFlap = await gameRef.loadSprite(Assets.gunMidFlap);
    final gunUpFlap = await gameRef.loadSprite(Assets.gunUpFlap);
    final gunDownFlap = await gameRef.loadSprite(Assets.gunDownFlap);
    final gunMidFlap2 = await gameRef.loadSprite(Assets.gunMidFlap2);
    final gunUpFlap2 = await gameRef.loadSprite(Assets.gunUpFlap2);
    final gunDownFlap2 = await gameRef.loadSprite(Assets.gunDownFlap2);


    size = Vector2(50, 50);
    position = Vector2(Config.gunX,gameRef.size.y/2-size.y/2);
    current = GunMovement.middle;
    if(Sex==GunSex.female)
    sprites = {

      GunMovement.middle: gunMidFlap,
      GunMovement.up: gunUpFlap,
      GunMovement.down: gunDownFlap,
    };
    if(Sex==GunSex.male)
      sprites = {
        GunMovement.middle: gunMidFlap2,
        GunMovement.up: gunUpFlap2,
        GunMovement.down: gunDownFlap2,
      };
    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    debugPrint('Collision Detacted');

    FlameAudio.play(Assets.wocaobing);





    gameOver();
  }

  void gameOver(){
    game.isHit =true;
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();

  }

  void fly(){
    add(
      MoveByEffect(Vector2(0,Config.gunVelocity),EffectController(duration: 0.15,curve: Curves.decelerate),
      onComplete: () => current = GunMovement.down,
      )
    );

    current = GunMovement.up;
    FlameAudio.play(Assets.chongci);
  }

  void reset(){
    position = Vector2(Config.gunX,gameRef.size.y/2-size.y/2);
    current = GunMovement.middle;
    score =0;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.gravity * dt;

    if (position.y < 0) {
      FlameAudio.play(Assets.shangsheng);
      gameOver();
    }

    if (score % 5 == 0 && score != 0&&!isLaughed) {

      FlameAudio.play(score%10==0? Assets.laugh:Assets.xuedaole,volume: 0.7);
      isLaughed = true;
    }
    if(score % 5 == 1){
      isLaughed = false;
    }
  }
}

