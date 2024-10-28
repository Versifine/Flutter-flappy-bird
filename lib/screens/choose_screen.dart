import 'package:flappy_gun_game/components/gun.dart';
import 'package:flappy_gun_game/game/Flappy_Gun_Game.dart';
import 'package:flappy_gun_game/game/assets.dart';
import 'package:flappy_gun_game/game/gun_movement.dart';
import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';

class ChoosePage extends StatelessWidget {
  final FlappyGunGame game;
  static const String id = 'choosePage';
  const ChoosePage({Key ? key,required this.game}):super (key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // 这里需要设置页面背景的asset路径
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 270,),
            Text(
              '请在双子中选择一人',
              style: TextStyle(
                color: Colors.redAccent,
                backgroundColor: Colors.black38,
                fontSize: 40
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('Left image clicked');
                      game.overlays.remove('choosePage');

                      FlameAudio.play(Assets.daoli);
                      FlameAudio.bgm.stop();
                      game.remove(game.gun);
                      game.gun.Sex=GunSex.female;
                      game.add(game.gun);
                      game.resumeEngine();
                    },
                    child: Image.asset(
                      // 这里需要设置左边图像的asset路径
                      Assets.gunModel,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: () {
                      print('Right image clicked');
                      game.overlays.remove('choosePage');


                      FlameAudio.play(Assets.daoli);
                      FlameAudio.bgm.stop();
                      game.remove(game.gun);
                      game.gun= Gun(Sex: GunSex.male);
                      game.add(game.gun);
                      game.resumeEngine();
                    },
                    child: Image.asset(
                      // 这里需要设置右边图像的asset路径
                      Assets.gunModel2,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
