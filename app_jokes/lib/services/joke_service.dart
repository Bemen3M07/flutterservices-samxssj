import 'package:http/http.dart' as http;
import '../models/joke_model.dart';

class JokeService {
  final String _baseUrl = 'https://api.sampleapis.com/jokes/goodJokes';

  // Mètode per obtenir un acudit aleatori
  Future<JokeModel> fetchJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      // L'API retorna una llista d'acudits → En triem un a l'atzar
      final List<JokeModel> jokes = jokeModelFromJson(response.body);
      jokes.shuffle(); // Barregem per obtenir un acudit aleatori
      return jokes.first;
    } else {
      throw Exception('Error carregant l\'acudit');
    }
  }
}