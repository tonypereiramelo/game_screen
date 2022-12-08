import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ShotTile extends StatelessWidget {
  const ShotTile({super.key});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      indicatorStyle: const IndicatorStyle(
        width: 40,
        height: 40,
        indicator: CircleAvatar(
          child: Icon(Icons.person),
        ),
      ),
      alignment: TimelineAlign.start,
      endChild: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
              child: Text('Goal'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_circle),
            )
          ],
        ),
      ),
    );
  }
}
