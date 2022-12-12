class TeamModel {
  TeamModel({
    this.teamName,
    this.score,
    this.shotType,
    this.shotLink,
    this.isLeftTeam,
    this.shotDate,
  });

  String? teamName;
  int? score;
  String? shotType;
  String? shotLink;
  bool? isLeftTeam;
  DateTime? shotDate;

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
    );
  }

  factory TeamModel.fromDomain(TeamModel teamModel) => TeamModel(
        teamName: teamModel.teamName,
        score: teamModel.score,
        shotType: teamModel.shotType,
        shotLink: teamModel.shotLink,
        isLeftTeam: teamModel.isLeftTeam,
        shotDate: teamModel.shotDate!
      );
}
