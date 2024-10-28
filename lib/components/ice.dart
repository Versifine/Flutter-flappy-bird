import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_gun_game/game/Flappy_Gun_Game.dart';
import 'package:flappy_gun_game/game/assets.dart';
import 'package:flappy_gun_game/game/comfiguration.dart';
import 'package:flappy_gun_game/game/ice_position.dart';

class Ice extends SpriteComponent with HasGameRef<FlappyGunGame>{
  Ice({
    required this.icePosition,
    required this.height,
});

  @override
  final double height;
  final IcePosition icePosition;

  @override
  Future<void> onLoad() async{
    final ice = await Flame.images.load(Assets.ice);
    final iceRotated = await Flame.images.load(Assets.iceRotated);
    size = Vector2(50, height);

    switch (icePosition){
      case IcePosition.top:
        position.y = 0;
        sprite =Sprite(iceRotated);
        break;
      case IcePosition.bottom:
        position.y = gameRef.size.y -size.y - Config.groundHeight;
        sprite = Sprite(ice);
        break;
    }

    add(RectangleHitbox());
  }
}