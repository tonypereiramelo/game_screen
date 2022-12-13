import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../global/domain/team_model.dart';

TeamModel fromFirestore(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? snapshotOptions,
) {
  if (snapshot.exists) {
    try {
      return TeamModel.fromJson(snapshot.data()!).toDomain();
    } catch (e) {
      log(e.toString());
      return TeamModel();
    }
  } else {
    log('Not found');
    return TeamModel();
  }
}

Map<String, Object?> toFirestore(
  TeamModel teamModel,
  SetOptions? setOptions,
) =>
    teamModel.toJson();
