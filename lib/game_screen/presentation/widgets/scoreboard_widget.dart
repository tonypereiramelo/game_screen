import 'package:flutter/material.dart';

class ScoreboardWidget extends StatelessWidget {
  const ScoreboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Container(
        color: Colors.grey,
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(size: 38, Icons.ac_unit_outlined),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      color: Colors.black45,
                      height: 58,
                      width: 38,
                      child: Center(
                        child: Text(
                          '1',
                          style: theme.textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      color: Colors.black45,
                      height: 58,
                      width: 38,
                      child: Center(
                        child: Text(
                          '2',
                          style: theme.textTheme.headline6,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(size: 38, Icons.sports_soccer),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Time1',
                    style: theme.textTheme.headline6,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Time2',
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
