import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/domain/team_model.dart';
import 'package:game_screen/shot_visualizer/presentation/shot_page.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ShotTile extends StatelessWidget {
  const ShotTile({super.key, required this.team});

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TimelineTile(
      indicatorStyle: const IndicatorStyle(
        width: 40,
        height: 40,
        indicator: CircleAvatar(
          child: Icon(Icons.person),
        ),
      ),
      alignment: TimelineAlign.center,
      startChild: team.isLeftTeam!
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShotPage(
                          teamModel: team,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.play_circle),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
                    child: Text(
                      team.shotType.toString(),
                      style: theme.textTheme.headline6,
                    ),
                  ),
                ],
              ),
            )
          : null,
      endChild: !team.isLeftTeam!
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
                    child: Text(
                      team.shotType.toString(),
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShotPage(
                          teamModel: team,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.play_circle),
                  )
                ],
              ),
            )
          : null,
    );
  }
}
