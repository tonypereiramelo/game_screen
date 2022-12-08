import 'package:flutter/material.dart';
import 'package:game_screen/shot_visualizer/presentation/widgets/shot_comment_tile.dart';

class ShotComments extends StatelessWidget {
  const ShotComments({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ShotCommentTile(),
      ),
    );
  }
}
