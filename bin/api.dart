import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getCurrentWeather(String city, String apiKey) async {
  final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'));

  if (response.statusCode == 200) {
    Map<String, dynamic> weatherData = (json.decode(response.body) as Map<String, dynamic>);
    return weatherData;
  } else {
    throw Exception('Нету');
  }
}

void main() async {
  String apiKey = '761f294779317b18b184b91a14743b63';
  String city = 'Uganda';

  Map<String, dynamic> currentWeather = await getCurrentWeather(city, apiKey);
  print('Текщая погода');
  print('Температура:$city ${currentWeather['main']['temp'] - 273.15}°C');
}