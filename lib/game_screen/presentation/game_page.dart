import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/presentation/widgets/shot_tile.dart';
import 'package:timelines/timelines.dart';

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
      body: Timeline.tileBuilder(
          builder: TimelineTileBuilder.fromStyle(
              contentsAlign: ContentsAlign.alternating,
              contentsBuilder: (context, index) => const ShotTile(),
              itemCount: 10)),
    );
  }
}
