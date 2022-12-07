import 'package:flutter/material.dart';

class ShotTile extends StatelessWidget {
  const ShotTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
                child: Text('Gol'),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle))
        ],
      ),
    );
  }
}
