import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/car_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CarHttpService {
  final String _serverUrl = "https://car-data.p.rapidapi.com";
  final String _headerKey = dotenv.env['RAPIDAPI_KEY'] ?? "";
  final String _headerHost = "car-data.p.rapidapi.com";

  Future<List<CarsModel>> getCars() async {
    var uri = Uri.parse("$_serverUrl/cars");

    var response = await http.get(uri, headers: {
      "x-rapidapi-key": _headerKey,
      "x-rapidapi-host": _headerHost
    });

    if (response.statusCode == 200) {
      return carsModelFromJson(response.body);
    } else {
      throw Exception("Error al obtenir la llista de cotxes: ${response.statusCode}");
    }
  }
}
