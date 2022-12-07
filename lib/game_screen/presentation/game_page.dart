import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/presentation/widgets/shot_tile.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) => const ShotTile(),
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.red,
          width: 80,
          thickness: 2,
        ),
      ),
    );
  }
}
