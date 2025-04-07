# Modern Weather App

A beautiful and minimal weather application built with Flutter that shows current weather information with a modern UI design.

## Features

- 🌤️ Real-time weather data
- 📍 Location-based weather information
- 🔍 City search functionality
- 🌅 Dynamic background based on time of day
- 📊 Essential weather details (temperature, humidity, wind speed)
- 🎨 Modern and minimal UI design

## Setup

1. Clone the repository
2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```
3. Create a `.env` file in the root directory and add your WeatherAPI key:
   ```
   WEATHER_API_KEY=your_api_key_here
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- flutter
- http
- geolocator
- lottie
- google_fonts
- flutter_dotenv
- intl

## Getting a WeatherAPI Key

1. Go to [WeatherAPI.com](https://www.weatherapi.com/)
2. Sign up for a free account
3. Get your API key from the dashboard
4. Add it to the `.env` file

## Note

Make sure to enable location permissions on your device to get weather information for your current location. 