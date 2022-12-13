import 'package:game_screen/game_screen/domain/team_model.dart';
import 'package:game_screen/game_screen/infrastructure/game_screen_repository.dart';
import 'package:get/get.dart';

class GameScreenController extends GetxController {
  GameScreenController();
  final repository = GameScreenRepository();

  final status = Rx<RxStatus>(RxStatus.empty());
  final shots = Rxn<List<TeamModel>>();
  final comments = Rx<List<String>>([]);

  @override
  void onInit() {
    super.onInit();
    getTeam();
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
}
