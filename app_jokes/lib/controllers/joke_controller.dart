import 'package:flutter/material.dart';
import '../models/joke_model.dart';
import '../services/joke_service.dart';

class JokeController extends ChangeNotifier {
  final JokeService _jokeService = JokeService();

  JokeModel? _joke;
  bool _isLoading = false;
  String? _error;

  JokeModel? get joke => _joke;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Mètode per carregar un nou acudit
  Future<void> loadJoke() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _joke = await _jokeService.fetchJoke();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
