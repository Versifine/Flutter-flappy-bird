import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_gun_game/game/Flappy_Gun_Game.dart';
import 'package:flappy_gun_game/game/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget{
  final FlappyGunGame game;
  static const String id = 'gameOver';

  const GameOverScreen({super.key,required this.game});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.black38,
      child:  Center(
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Score: ${game.gun.score}',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),

              ),

              Image(image: AssetImage(Assets.gameOver),
                fit: BoxFit.fill,
                width:250,
                height: 50,
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: ()=>onRestart(),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                      'Restart',
                      style: TextStyle(fontSize: 20),
                  )
              )
            ],

          ),

      ),
    );
  }

  void onRestart(){
    game.gun.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
    FlameAudio.play(Assets.daoli);

  }

}