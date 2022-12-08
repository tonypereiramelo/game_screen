import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../game_screen/domain/team_model.dart';

Either<String, TeamModel> fromFirestore(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? snapshotOptions,
) {
  if (snapshot.exists) {
    try {
      return right(TeamModel.fromJson(snapshot.data()!).toDomain());
    } catch (e) {
      return left(e.toString());
    }
  } else {
    return left('Not Found');
  }
}

Map<String, Object?> toFirestore(
  Either<String, TeamModel> teamModel,
  SetOptions? setOptions,
) =>
    teamModel.fold(
      (l) => throw l.toString(),
      (r) => TeamModel.fromDomain(r).toJson(),
    );
