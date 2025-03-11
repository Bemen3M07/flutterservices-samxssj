import 'dart:convert';

// Funció per convertir JSON a una llista de JokeModel
List<JokeModel> jokeModelFromJson(String str) =>
    List<JokeModel>.from(json.decode(str).map((x) => JokeModel.fromJson(x)));

// Funció per convertir JokeModel a JSON
String jokeModelToJson(List<JokeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JokeModel {
  final String setup;
  final String punchline;

  JokeModel({
    required this.setup,
    required this.punchline,
  });

  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
        setup: json["setup"],
        punchline: json["punchline"],
      );

  Map<String, dynamic> toJson() => {
        "setup": setup,
        "punchline": punchline,
      };
}