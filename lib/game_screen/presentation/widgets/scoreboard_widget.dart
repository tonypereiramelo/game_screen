import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/presentation/constants.dart';
import 'package:game_screen/global/presentation/units.dart';
import 'package:game_screen/global/presentation/widgets/box_spacer.dart';

class ScoreboardWidget extends StatelessWidget {
  const ScoreboardWidget({
    super.key,
    required this.leftScore,
    required this.rigthScore,
    required this.leftTeamIcon,
    required this.rigthTeamIcon,
    required this.leftTeamName,
    required this.rigthTeamName,
  });

  final String leftScore;
  final String rigthScore;
  final IconData leftTeamIcon;
  final IconData rigthTeamIcon;
  final String leftTeamName;
  final String rigthTeamName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(DSUnits.medium)),
      child: Container(
        color: Colors.grey,
        height: GameScreenThemeConstants.scoreboardSize,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(DSUnits.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: GameScreenThemeConstants.scoreboardRadius,
                    child: Icon(
                        size: GameScreenThemeConstants.scoreboardSizeMedium,
                        leftTeamIcon),
                  ),
                  const DSBoxSpacer.medium(),
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(DSUnits.small)),
                    child: Container(
                      color: Colors.black45,
                      height: GameScreenThemeConstants.scoreHeight,
                      width: GameScreenThemeConstants.scoreboardSizeMedium,
                      child: Center(
                        child: Text(
                          leftScore,
                          style: theme.textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  const DSBoxSpacer.medium(),
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(DSUnits.small)),
                    child: Container(
                      color: Colors.black45,
                      height: GameScreenThemeConstants.scoreHeight,
                      width: GameScreenThemeConstants.scoreboardSizeMedium,
                      child: Center(
                        child: Text(
                          rigthScore,
                          style: theme.textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  const DSBoxSpacer.medium(),
                  CircleAvatar(
                    radius: GameScreenThemeConstants.scoreboardRadius,
                    child: Icon(
                        size: GameScreenThemeConstants.scoreboardSizeMedium,
                        rigthTeamIcon),
                  ),
                ],
              ),
              const DSBoxSpacer.medium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    leftTeamName,
                    style: theme.textTheme.headline6,
                  ),
                  const DSBoxSpacer.medium(),
                  Text(
                    rigthTeamName,
                    style: theme.textTheme.headline6,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
