class TeamModel {
  TeamModel({
    required this.teamName,
    required this.score,
    required this.shotType,
    required this.shotLink,
    required this.shotDate,
    required this.isLeftTeam,
  });

  String teamName;
  int score;
  String shotType;
  String shotLink;
  DateTime shotDate;
  bool isLeftTeam;

  factory TeamModel.fromJson(Map<String, dynamic> json) =>
      TeamModel.fromJson(json);

  Map<String, dynamic> toJson() {
    return {
      "teamName": teamName,
      "score": score,
      "shotType": shotType,
      "shotLink": shotLink,
      "shotDate": shotDate,
      "isLeftTeam": isLeftTeam,
    };
  }
}
