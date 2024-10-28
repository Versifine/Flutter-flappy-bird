import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_gun_game/game/Flappy_Gun_Game.dart';
import 'package:flappy_gun_game/game/assets.dart';

class Background extends SpriteComponent with HasGameRef<FlappyGunGame>{
    Background();

    @override
    Future<void> onLoad() async{
      final background =await Flame.images.load(Assets.background);
      size = gameRef.size;
      sprite = Sprite(background);
    }
}