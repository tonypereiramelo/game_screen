import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/application/game_screen_controller.dart';
import 'package:game_screen/game_screen/presentation/widgets/scoreboard_widget.dart';
import 'package:game_screen/game_screen/presentation/widgets/shot_tile.dart';
import 'package:game_screen/global/presentation/units.dart';
import 'package:get/get.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put<GameScreenController>(GameScreenController());
    return Obx(
      () {
        if (controller.status.value.isSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Game'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(DSUnits.medium),
              child: Column(
                children: [
                  ScoreboardWidget(
                    leftScore: controller.leftScore.value.toString(),
                    leftTeamIcon: Icons.ac_unit_outlined,
                    leftTeamName: 'Left Team',
                    rigthScore: controller.rigthScore.value.toString(),
                    rigthTeamIcon: Icons.sports_soccer,
                    rigthTeamName: 'Right Team',
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.shots.value!.length,
                      itemBuilder: (context, index) => ShotTile(
                        team: controller.shots.value![index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (controller.status.value.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Game'),
              centerTitle: true,
            ),
            body: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Game'),
              centerTitle: true,
            ),
            body: Center(
              child: Text(
                'Error',
                style: theme.textTheme.headline6,
              ),
            ),
          );
        }
      },
    );
  }
}
