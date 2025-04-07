import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/weather_data.dart';

// WeatherAPI ile iletişim kurmak için kullanılan repository sınıfı
class WeatherRepository {
  // Belirtilen şehir için hava durumu ve 3 günlük tahmin verilerini getiren metod
  Future<WeatherData> getWeatherByCity(String city) async {
    // .env dosyasından API anahtarını al
    final apiKey = dotenv.env['WEATHER_API_KEY'];
    
    // WeatherAPI'ye istek at
    // days=3 parametresi ile 3 günlük tahmin verilerini de alıyoruz
    final response = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=3&aqi=no'));

    // API yanıtını kontrol et
    if (response.statusCode == 200) {
      // Başarılı yanıtı WeatherData nesnesine dönüştür
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      // Hata durumunda exception fırlat
      throw Exception('Şehir bulunamadı');
    }
  }
} 