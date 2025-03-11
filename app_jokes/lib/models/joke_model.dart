import 'dart:convert';

// Funció per convertir JSON a JokeModel
JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

// Funció per convertir JokeModel a JSON
String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

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
