import 'package:flutter/material.dart';
import '../models/weather_data.dart';
import '../repositories/weather_repository.dart';

// Hava durumu ekranı için ViewModel sınıfı
class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _repository;
  
  WeatherData? _weatherData;
  bool _isLoading = false;
  String? _error;

  // Constructor
  WeatherViewModel({WeatherRepository? repository}) 
      : _repository = repository ?? WeatherRepository();

  // Getters
  WeatherData? get weatherData => _weatherData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Şehir arama işlemi
  Future<void> searchCity(String city) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _weatherData = await _repository.getWeatherByCity(city);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Şehir bulunamadı';
      _isLoading = false;
      notifyListeners();
    }
  }

  // Hata durumunu temizle
  void clearError() {
    _error = null;
    notifyListeners();
  }
} 