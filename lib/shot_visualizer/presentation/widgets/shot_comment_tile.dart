import 'package:flutter/material.dart';
import 'package:game_screen/global/presentation/units.dart';
import 'package:game_screen/global/presentation/widgets/box_spacer.dart';

class ShotCommentTile extends StatelessWidget {
  const ShotCommentTile(
      {super.key, required this.userName, required this.userComment});
  final String userName;
  final String userComment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(DSUnits.small),
      child: Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
          const DSBoxSpacer.medium(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: theme.textTheme.subtitle2,
              ),
              const DSBoxSpacer.xxSmall(),
              Text(
                userComment,
                style: theme.textTheme.subtitle2,
              ),
              const DSBoxSpacer.xxSmall(),
              InkWell(
                  onTap: () {},
                  child: Text(
                    'Responder',
                    style: theme.textTheme.button,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
