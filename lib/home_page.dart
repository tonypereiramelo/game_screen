import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/presentation/game_page.dart';
import 'package:game_screen/global/widgets/box_spacer.dart';

import 'upload_videos/presentation/upload_videos_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UploadPage(
                      theme: theme,
                    ),
                  ),
                ),
                style: theme.elevatedButtonTheme.style,
                child: const Text('Uploads Page'),
              ),
              const DSBoxSpacer.small(),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const GamePage(),
                  ),
                ),
                style: theme.elevatedButtonTheme.style,
                child: const Text('View Game Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
