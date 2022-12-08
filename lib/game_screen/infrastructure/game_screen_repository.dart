import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:game_screen/game_screen/domain/team_model.dart';
import 'package:game_screen/game_screen/infrastructure/core/firebase_helpers.dart';

class GameScreenRepository {
  GameScreenRepository();
  final firestore = FirebaseFirestore.instance;

  Future<Either<String, TeamModel>> getTeam() async {
    try {
      final doc = firestore
          .collection('games')
          .doc('game1')
          .withConverter<Either<String, TeamModel>>(
              fromFirestore: fromFirestore, toFirestore: toFirestore);

      return await doc.get().then((snapshot) {
        if (snapshot.exists) {
          return snapshot.data()!.fold((l) => left(l), (r) => right(r));
        } else {
          return left('Not Found');
        }
      });
    } catch (error) {
      return left(error.toString());
    }
  }
}
