import 'package:flutter/material.dart';
import 'package:game_screen/shot_visualizer/presentation/widgets/shot_comment_tile.dart';
import 'package:get/get.dart';

import '../../../game_screen/application/game_screen_controller.dart';

class ShotComments extends StatelessWidget {
  ShotComments({super.key});

  final controller = Get.put<GameScreenController>(GameScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.status.value.isSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: controller.comments.value.length,
            itemBuilder: (context, index) => ShotCommentTile(
              userName: 'James',
              userComment: controller.comments.value[index],
            ),
          ),
        );
      } else if (controller.status.value.isLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else {
        return const Center(
          child: Text('Error'),
        );
      }
    });
  }
}
