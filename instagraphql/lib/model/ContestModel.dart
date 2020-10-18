class ContestModel {
  String winner1,
      winner2,
      winner3,
      winner4,
      winner5,
      winner6,
      winner7,
      winner8,
      winner9,
      winner10;

  ContestModel(
      this.winner1,
      this.winner2,
      this.winner3,
      this.winner4,
      this.winner5,
      this.winner6,
      this.winner7,
      this.winner8,
      this.winner9,
      this.winner10);

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();

    data["winner1"] = winner1;
    data["winner2"] = winner2;
    data["winner3"] = winner3;
    data["winner4"] = winner4;
    data["winner5"] = winner5;
    data["winner6"] = winner6;
    data["winner7"] = winner7;
    data["winner8"] = winner8;
    data["winner9"] = winner9;
    data["winner10"] = winner10;

    return data;
  }

  ContestModel.fromJson(Map<String, dynamic> parsedJson) {
    winner1 = parsedJson['winner1'];
    winner2 = parsedJson['winner2'];
    winner3 = parsedJson['winner3'];
    winner4 = parsedJson['winner4'];
    winner5 = parsedJson['winner5'];
    winner6 = parsedJson['winner6'];
    winner7 = parsedJson['winner7'];
    winner8 = parsedJson['winner8'];
    winner9 = parsedJson['winner9'];
    winner10 = parsedJson['winner10'];
  }
}
