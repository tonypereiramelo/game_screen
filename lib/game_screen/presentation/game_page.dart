import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/domain/team_model.dart';
import 'package:game_screen/game_screen/presentation/application/game_screen_controller.dart';
import 'package:game_screen/game_screen/presentation/widgets/scoreboard_widget.dart';
import 'package:game_screen/game_screen/presentation/widgets/shot_tile.dart';
import 'package:get/get.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});

  final controller = Get.put<GameScreenController>(GameScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.status.value.isSuccess) {
          final link = controller.team.value!.shotLink;
          List<TeamModel> teams = [
            TeamModel(
              teamName: 'Team1',
              score: 1,
              shotType: 'Goal',
              isLeftTeam: true,
              shotLink: link,
            ),
            TeamModel(
              teamName: 'Team2',
              score: 0,
              shotType: 'Foul',
              isLeftTeam: false,
              shotLink: link,
            ),
            TeamModel(
              teamName: 'Team2',
              score: 1,
              shotType: 'Goal',
              isLeftTeam: false,
              shotLink: link,
            ),
            TeamModel(
              teamName: 'Team1',
              score: 1,
              shotType: 'Foul',
              isLeftTeam: true,
              shotLink: link,
            ),
            TeamModel(
              teamName: 'Team1',
              score: 2,
              shotType: 'Goal',
              isLeftTeam: true,
              shotLink: link,
            ),
            TeamModel(
              teamName: 'Team1',
              score: 2,
              shotType: 'Foul',
              isLeftTeam: true,
              shotLink: link,
            ),
            TeamModel(
              teamName: 'Team2',
              score: 1,
              shotType: 'Foul',
              isLeftTeam: false,
              shotLink: link,
            ),
          ];

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
        } else if (controller.status.value.isLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
