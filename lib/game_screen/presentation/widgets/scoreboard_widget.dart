import 'package:flutter/material.dart';
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
        height: 150,
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
                    radius: 30,
                    child: Icon(size: 38, leftTeamIcon),
                  ),
                  const DSBoxSpacer.medium(),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      color: Colors.black45,
                      height: 58,
                      width: 38,
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
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      color: Colors.black45,
                      height: 58,
                      width: 38,
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
                    radius: 30,
                    child: Icon(size: 38, rigthTeamIcon),
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
