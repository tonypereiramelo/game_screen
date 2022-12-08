import 'package:flutter/material.dart';

class ShotCommentTile extends StatelessWidget {
  const ShotCommentTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const CircleAvatar(
            child: Icon(Icons.person),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'userName',
                style: theme.textTheme.subtitle2,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Boqueado pelo STF',
                style: theme.textTheme.subtitle2,
              ),
              const SizedBox(
                height: 2,
              ),
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
