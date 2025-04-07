import 'package:flutter/material.dart';

class ThemeUtils {
  static List<Color> getBackgroundColors(String condition) {
    condition = condition.toLowerCase();
    
    if (condition.contains('rain') || condition.contains('drizzle')) {
      return [Colors.blueGrey, Colors.blueGrey.shade700];
    } else if (condition.contains('cloud')) {
      return [Colors.grey.shade400, Colors.grey.shade600];
    } else if (condition.contains('snow')) {
      return [Colors.lightBlue.shade100, Colors.lightBlue.shade200];
    } else if (condition.contains('thunder') || condition.contains('storm')) {
      return [Colors.deepPurple.shade400, Colors.deepPurple.shade700];
    } else if (condition.contains('mist') || condition.contains('fog')) {
      return [Colors.blueGrey.shade200, Colors.blueGrey.shade400];
    } else {
      // Clear/Sunny default
      return [Colors.blue.shade300, Colors.blue.shade500];
    }
  }
} 