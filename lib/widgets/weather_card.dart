import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/weather_data.dart';

class WeatherCard extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherCard({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            weatherData.city,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${weatherData.temperature.round()}°C',
            style: GoogleFonts.poppins(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            weatherData.condition,
            style: GoogleFonts.poppins(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
} 