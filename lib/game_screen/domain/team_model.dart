import 'package:cloud_firestore/cloud_firestore.dart';

class TeamModel {
  TeamModel({
    this.teamName,
    this.score,
    this.shotType,
    this.shotLink,
    this.isLeftTeam,
    this.shotDate,
    this.comments,
  });

  String? teamName;
  int? score;
  String? shotType;
  String? shotLink;
  bool? isLeftTeam;
  DateTime? shotDate;
  List<Map>? comments;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      TeamModel.fromJson(json);

  Map<String, dynamic> toJson() {
    return {
      "teamName": teamName,
      "score": score,
      "shotType": shotType,
      "shotLink": shotLink,
      "isLeftTeam": isLeftTeam,
      "shotDate": shotDate.toString(),
      "comments": comments,
    };
  }

  TeamModel toDomain() {
    return TeamModel(
      teamName: teamName,
      score: score,
      shotType: shotType,
      shotLink: shotLink,
      isLeftTeam: isLeftTeam,
      shotDate: shotDate,
      comments: comments,
    );
  }

  factory TeamModel.fromDocument(
          DocumentSnapshot<Map<String, dynamic>> document) =>
      TeamModel(
        teamName: document.data()!["teamName"],
        score: document.data()!["score"],
        shotDate: DateTime.parse(
          document.data()!["shotDate"],
        ),
        shotType: document.data()!["shotType"],
        isLeftTeam: document.data()!["isLeftTeam"],
        shotLink: document.data()!["shotLink"],
        comments: document.data()!["comments"],
      );

  factory TeamModel.fromDomain(TeamModel teamModel) => TeamModel(
        teamName: teamModel.teamName,
        score: teamModel.score,
        shotType: teamModel.shotType,
        shotLink: teamModel.shotLink,
        isLeftTeam: teamModel.isLeftTeam,
        shotDate: teamModel.shotDate!,
        comments: teamModel.comments,
      );
}
