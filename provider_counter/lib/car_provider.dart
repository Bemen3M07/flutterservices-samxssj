import 'package:flutter/foundation.dart';
import 'package:empty/car_http_service.dart';
import 'package:empty/car_model.dart';

class CarProvider extends ChangeNotifier {
  final CarHttpService _carHttpService = CarHttpService();
  List<CarsModel> _cars = [];
  bool _isLoading = false;
  String? _error;

  List<CarsModel> get cars => _cars;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Mètode per obtenir la llista de cotxes
  Future<void> fetchCars() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _cars = await _carHttpService.getCars();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners(); // Notifiquem que l'estat ha canviat
    }
  }
}
