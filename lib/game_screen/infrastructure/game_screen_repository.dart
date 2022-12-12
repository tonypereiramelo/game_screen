import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:game_screen/game_screen/domain/team_model.dart';

class GameScreenRepository {
  GameScreenRepository();
  final firestore = FirebaseFirestore.instance;

  Future<Either<String, List<TeamModel>>> getTeam() async {
    try {
      final doc = firestore.collection('shots').get();

      return await doc.then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return right(snapshot.docs
              .map((value) => TeamModel.fromDocument(value))
              .toList());
        } else {
          return left('Not Found');
        }
      });
    } catch (error) {
      return left(error.toString());
    }
  }
}
