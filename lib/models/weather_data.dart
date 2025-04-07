// WeatherAPI'den gelen verileri modellemek için kullanılan sınıf
class WeatherData {
  // Temel hava durumu bilgileri
  final String city;          // Şehir adı
  final String country;       // Ülke adı
  final String localTime;     // Yerel saat
  final double temperature;   // Sıcaklık
  final double feelsLike;     // Hissedilen sıcaklık
  final String condition;     // Hava durumu açıklaması (örn: "Sunny", "Cloudy")
  final int humidity;         // Nem oranı (%)
  final double windSpeed;     // Rüzgar hızı (km/s)
  final String windDirection; // Rüzgar yönü
  final double pressure;      // Basınç (mb)
  final double precipitation; // Yağış miktarı (mm)
  final int cloud;           // Bulut oranı (%)
  final double uv;           // UV indeksi
  final String icon;         // Hava durumu ikonu URL'i
  final List<DailyForecast> forecast; // 3 günlük tahmin listesi

  // Constructor
  WeatherData({
    required this.city,
    required this.country,
    required this.localTime,
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.precipitation,
    required this.cloud,
    required this.uv,
    required this.icon,
    required this.forecast,
  });

  // JSON verisini WeatherData nesnesine dönüştüren factory constructor
  factory WeatherData.fromJson(Map<String, dynamic> json) {
    // API'den gelen forecast verisini işleme
    final List<dynamic> forecastData = json['forecast']['forecastday'];
    final List<DailyForecast> forecast = forecastData.map((day) => DailyForecast.fromJson(day)).toList();

    return WeatherData(
      city: json['location']['name'],
      country: json['location']['country'],
      localTime: json['location']['localtime'],
      temperature: json['current']['temp_c'].toDouble(),
      feelsLike: json['current']['feelslike_c'].toDouble(),
      condition: json['current']['condition']['text'],
      humidity: json['current']['humidity'],
      windSpeed: json['current']['wind_kph'].toDouble(),
      windDirection: json['current']['wind_dir'],
      pressure: json['current']['pressure_mb'].toDouble(),
      precipitation: json['current']['precip_mm'].toDouble(),
      cloud: json['current']['cloud'],
      uv: json['current']['uv'].toDouble(),
      icon: json['current']['condition']['icon'],
      forecast: forecast,
    );
  }
}

// Günlük tahmin verilerini modellemek için kullanılan sınıf
class DailyForecast {
  final String date;              // Tarih
  final double maxTemp;          // Maksimum sıcaklık (°C)
  final double minTemp;          // Minimum sıcaklık (°C)
  final double avgTemp;          // Ortalama sıcaklık (°C)
  final String condition;        // Hava durumu açıklaması
  final String icon;             // Hava durumu ikonu URL'i
  final double chanceOfRain;     // Yağış olasılığı (%)
  final double maxWind;          // Maksimum rüzgar hızı (km/s)
  final double totalPrecipitation; // Toplam yağış miktarı (mm)

  // Constructor
  DailyForecast({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.condition,
    required this.icon,
    required this.chanceOfRain,
    required this.maxWind,
    required this.totalPrecipitation,
  });

  // JSON verisini DailyForecast nesnesine dönüştüren factory constructor
  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: json['date'],
      maxTemp: json['day']['maxtemp_c'].toDouble(),
      minTemp: json['day']['mintemp_c'].toDouble(),
      avgTemp: json['day']['avgtemp_c'].toDouble(),
      condition: json['day']['condition']['text'],
      icon: json['day']['condition']['icon'],
      chanceOfRain: json['day']['daily_chance_of_rain'].toDouble(),
      maxWind: json['day']['maxwind_kph'].toDouble(),
      totalPrecipitation: json['day']['totalprecip_mm'].toDouble(),
    );
  }
} 