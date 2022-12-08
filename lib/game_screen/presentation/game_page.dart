import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/domain/team_model.dart';
import 'package:game_screen/game_screen/presentation/widgets/scoreboard_widget.dart';
import 'package:game_screen/game_screen/presentation/widgets/shot_tile.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<TeamModel> teams = [
    TeamModel(
      teamName: 'Team1',
      score: 1,
      shotType: 'Goal',
      isLeftTeam: true,
    ),
    TeamModel(
      teamName: 'Team2',
      score: 0,
      shotType: 'foul',
      isLeftTeam: false,
    ),
    TeamModel(
      teamName: 'Team2',
      score: 1,
      shotType: 'Goal',
      isLeftTeam: false,
    ),
    TeamModel(
      teamName: 'Team1',
      score: 1,
      shotType: 'foul',
      isLeftTeam: true,
    ),
    TeamModel(
      teamName: 'Team1',
      score: 2,
      shotType: 'Goal',
      isLeftTeam: true,
    ),
    TeamModel(
      teamName: 'Team1',
      score: 2,
      shotType: 'foul',
      isLeftTeam: true,
    ),
    TeamModel(
      teamName: 'Team2',
      score: 1,
      shotType: 'foul',
      isLeftTeam: false,
    ),
  ];
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
                itemCount: teams.length,
                itemBuilder: (context, index) => ShotTile(
                  team: teams[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
