import 'package:cloud_firestore/cloud_firestore.dart';

class TeamModel {
  TeamModel({
    this.teamName,
    this.score,
    this.shotType,
    this.shotLink,
    this.isLeftTeam,
  });

  String? teamName;
  int? score;
  String? shotType;
  String? shotLink;
  bool? isLeftTeam;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      TeamModel.fromJson(json);

  Map<String, dynamic> toJson() {
    return {
      "teamName": teamName,
      "score": score,
      "shotType": shotType,
      "shotLink": shotLink,
      "isLeftTeam": isLeftTeam,
    };
  }

  TeamModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    teamName = document.data()!.values.toList()[0];
    score = document.data()!.values.toList()[1];
    shotType = document.data()!.values.toList()[2];
    shotLink = document.data()!.values.toList()[4];
    isLeftTeam = document.data()!.values.toList()[3];
  }

  TeamModel toDomain() {
    return TeamModel(
      teamName: teamName,
      score: score,
      shotType: shotType,
      shotLink: shotLink,
      isLeftTeam: isLeftTeam,
    );
  }

  factory TeamModel.fromDomain(TeamModel teamModel) => TeamModel(
        teamName: teamModel.teamName,
        score: teamModel.score,
        shotType: teamModel.shotType,
        shotLink: teamModel.shotLink,
        isLeftTeam: teamModel.isLeftTeam,
      );
}
