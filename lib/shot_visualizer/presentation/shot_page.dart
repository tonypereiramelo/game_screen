import 'package:flutter/material.dart';
import 'package:game_screen/shot_visualizer/presentation/widgets/shot_comments.dart';

class ShotPage extends StatelessWidget {
  const ShotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shot'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: Colors.grey,
                  child: const Icon(size: 60, Icons.play_arrow),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Comments',
              style: theme.textTheme.headline6,
            ),
            SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: const ShotComments()),
          ],
        ),
      ),
    );
  }
}
