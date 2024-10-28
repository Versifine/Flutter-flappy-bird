import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_gun_game/game/Flappy_Gun_Game.dart';
import 'package:flappy_gun_game/game/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainMenuScreen extends StatelessWidget{
  final FlappyGunGame game;
  static const String id = 'mainMenu';
  static bool isPlayed =false;
  const MainMenuScreen({Key? key,required this.game}):super (key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    game.pauseEngine();
    FlameAudio.bgm.initialize();

    if(!isPlayed) {
      FlameAudio.play(Assets.shengmenggunge);
      FlameAudio.bgm.play(Assets.bgm,volume: 0.7);
      isPlayed = true;
    }


      return Scaffold(
          body: GestureDetector(
            onTap: (){
              game.overlays.remove('mainMenu');
              game.overlays.add('choosePage');

              // game.resumeEngine();
               FlameAudio.play(Assets.oneideshou);
              // FlameAudio.bgm.stop();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.menu),
                  fit: BoxFit.cover,
                ),

              ),
              child: Column(
                children: [
                  SizedBox(height: 500,),
                  Image(image: AssetImage(Assets.message),
                    fit: BoxFit.fill,
                    width:200,
                    height: 30,
                  ),
                  SizedBox(height: 30,),
                  Container(
                    color: Colors.black38,
                    width: 300,
                    height: 250,
                    child: Text(
                      '        一觉醒来，道理兄妹发现自己身处一个全是冰🧊的世界，难道这里是天堂？然而下一秒道理兄妹就被欧内的手无情的分开，理智告诉他们，必须要远离那些冰......玩家将扮演名为“道理”的申必角色，在自由的旅行中，抵御冰的诱惑，找回失散的亲人————同时，逐步发掘“吉吉国”的真相',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 18
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      );
    }
  }


