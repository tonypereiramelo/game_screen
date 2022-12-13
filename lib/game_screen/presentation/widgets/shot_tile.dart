import 'package:flutter/material.dart';
import 'package:game_screen/global/domain/team_model.dart';
import 'package:game_screen/game_screen/presentation/constants.dart';
import 'package:game_screen/global/presentation/units.dart';
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
        width: GameScreenThemeConstants.scoreTimeLineSize,
        height: GameScreenThemeConstants.scoreTimeLineSize,
        indicator: CircleAvatar(
          child: Icon(Icons.person),
        ),
      ),
      alignment: TimelineAlign.center,
      startChild: team.isLeftTeam!
          ? Padding(
              padding: const EdgeInsets.all(DSUnits.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShotPage(
                          videoLink: team.shotLink.toString(),
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.play_circle),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(DSUnits.xLarge, 0, 0, 0),
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
              padding: const EdgeInsets.all(DSUnits.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(DSUnits.xLarge, 0, 0, 0),
                    child: Text(
                      team.shotType.toString(),
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShotPage(
                          videoLink: team.shotLink.toString(),
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
