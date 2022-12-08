import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:game_screen/game_screen/domain/team_model.dart';

class GameScreenRepository {
  GameScreenRepository();
  final firestore = FirebaseFirestore.instance;

  Future<Either<String, TeamModel>> getTeam() async {
    try {
      final doc = firestore
          .collection('shots')
          .doc('16bea230-7729-11ed-bd8b-1b2372dd5b69')
          .get();

      return await doc.then((snapshot) {
        if (snapshot.exists) {
          return right(TeamModel.fromJson(snapshot.data()!).toDomain());
        } else {
          return left('Not Found');
        }
      });
    } catch (error) {
      return left(error.toString());
    }
  }
}
