import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/presentation/widgets/scoreboard_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ScoreboardWidget(
              leftScore: '2',
              leftTeamIcon: Icons.ac_unit_outlined,
              leftTeamName: 'Team1',
              rigthScore: '1',
              rigthTeamIcon: Icons.sports_soccer,
              rigthTeamName: 'Team2',
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const ShotTile(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
