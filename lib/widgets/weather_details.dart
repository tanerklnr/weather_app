import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/weather_data.dart';

class WeatherDetails extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherDetails({
    super.key,
    required this.weatherData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Detaylı Hava Durumu',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildDetailItem(
                icon: Icons.thermostat_outlined,
                title: 'Hissedilen',
                value: '${weatherData.feelsLike.round()}°C',
              ),
              _buildDetailItem(
                icon: Icons.water_drop_outlined,
                title: 'Nem',
                value: '%${weatherData.humidity}',
              ),
              _buildDetailItem(
                icon: Icons.air,
                title: 'Rüzgar',
                value: '${weatherData.windSpeed.round()} km/s\n${weatherData.windDirection}',
              ),
              _buildDetailItem(
                icon: Icons.compress,
                title: 'Basınç',
                value: '${weatherData.pressure.round()} mb',
              ),
              _buildDetailItem(
                icon: Icons.water,
                title: 'Yağış',
                value: '${weatherData.precipitation} mm',
              ),
              _buildDetailItem(
                icon: Icons.cloud_outlined,
                title: 'Bulut',
                value: '%${weatherData.cloud}',
              ),
              _buildDetailItem(
                icon: Icons.wb_sunny_outlined,
                title: 'UV İndeksi',
                value: '${weatherData.uv.round()}',
              ),
              _buildDetailItem(
                icon: Icons.schedule,
                title: 'Yerel Saat',
                value: weatherData.localTime.split(' ')[1],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 