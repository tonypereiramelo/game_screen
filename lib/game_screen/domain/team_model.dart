class TeamModel {
  TeamModel();

  String? teamName;
  int? score;
  String? shotType;
  String? shotLink;
  DateTime? shotDate;
  bool? isLeftTeam;

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
