import 'package:game_screen/global/domain/team_model.dart';
import 'package:game_screen/game_screen/infrastructure/game_screen_repository.dart';
import 'package:get/get.dart';

class GameScreenController extends GetxController {
  GameScreenController();
  final repository = GameScreenRepository();

  final status = Rx<RxStatus>(RxStatus.empty());
  final shots = Rxn<List<TeamModel>>();
  final comments = Rx<List<String>>([]);
  final leftScore = Rx<int>(0);
  final rigthScore = Rx<int>(0);

  @override
  void onInit() {
    super.onInit();
    getTeam().whenComplete(() => countGoal());
  }

  Future<void> getTeam() async {
    status.value = RxStatus.loading();
    await repository.getTeam().then(
          (value) => value.fold(
            (l) {
              status.value = RxStatus.error(l);
            },
            (r) {
              shots.value = r;

              status.value = RxStatus.success();
            },
          ),
        );
  }

  void countGoal() {
    for (TeamModel x in shots.value!) {
      if (x.isLeftTeam! && x.shotType! == 'Goal') {
        leftScore.value++;
      } else if (!x.isLeftTeam! && x.shotType! == 'Goal') {
        rigthScore.value++;
      }
    }
  }
}
