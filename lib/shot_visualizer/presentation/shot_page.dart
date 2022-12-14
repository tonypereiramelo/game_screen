import 'package:flutter/material.dart';
import 'package:game_screen/game_screen/application/game_screen_controller.dart';
import 'package:game_screen/global/presentation/constants.dart';
import 'package:game_screen/global/presentation/units.dart';
import 'package:game_screen/global/presentation/widgets/box_spacer.dart';
import 'package:game_screen/shot_visualizer/presentation/widgets/shot_comments.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ShotPage extends StatefulWidget {
  const ShotPage({super.key, required this.videoLink});

  final String videoLink;

  @override
  State<ShotPage> createState() => _ShotPageState();
}

class _ShotPageState extends State<ShotPage> {
  late VideoPlayerController controller;
  late GameScreenController gameScreenController;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.videoLink);
    gameScreenController =
        Get.put<GameScreenController>(GameScreenController());

    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() {}));
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shot'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(DSUnits.medium),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.all(Radius.circular(DSUnits.medium)),
              child: SizedBox(
                height: DSThemeConstants.widgetSizeXLarge,
                width: MediaQuery.of(context).size.width,
                child: Stack(alignment: Alignment.bottomCenter, children: [
                  VideoPlayer(controller),
                  ClosedCaption(text: controller.value.caption.text),
                  _ControlsOverlay(controller: controller),
                  VideoProgressIndicator(controller, allowScrubbing: true),
                ]),
              ),
            ),
            const DSBoxSpacer.small(),
            Text(
              'Comments',
              style: theme.textTheme.headline6,
            ),
            Obx(
              () => SizedBox(
                height: DSThemeConstants.widgetSizeXXLarge,
                width: MediaQuery.of(context).size.width,
                child: gameScreenController.comments.value != []
                    ? ShotComments()
                    : Text(
                        'Not comments',
                        style: theme.textTheme.headline6,
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding:
            const EdgeInsets.fromLTRB(DSUnits.medium, 0, DSUnits.medium, 0),
        child: TextField(
          controller: textEditingController,
          autofocus: true,
          onSubmitted: (value) => setState(() {
            gameScreenController.comments.value
                .insert(0, textEditingController.text);
            FocusManager.instance.primaryFocus?.unfocus();
            textEditingController.clear();
          }),
          decoration: InputDecoration(
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  DSBoxSpacer.small()
                ],
              ),
              hintText: 'Write your comment',
              hintStyle: theme.textTheme.button,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      gameScreenController.comments.value
                          .insert(0, textEditingController.text);
                      FocusManager.instance.primaryFocus?.unfocus();
                      textEditingController.clear();
                    });
                  },
                  icon: const Icon(Icons.send)),
              contentPadding: const EdgeInsets.all(DSUnits.large)),
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
