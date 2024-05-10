

import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_gun_game/game/Flappy_Gun_Game.dart';
import 'package:flappy_gun_game/screens/choose_screen.dart';
import 'package:flappy_gun_game/screens/game_over_screen.dart';
import 'package:flappy_gun_game/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {


  final game = FlappyGunGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const[MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
        'choosePage':(context, _) =>ChoosePage(game: game),
      },

    )
  );
}
