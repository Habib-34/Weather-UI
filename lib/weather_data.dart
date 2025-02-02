import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/twemoji.dart';

class WeatherData {
  Map<String, dynamic> weatherData = {
    "city": "New York",
    "currentWeather": {
      "temperature": 18,
      "condition": "Sun with Rain",
      "icon": Iconify(
        Twemoji.sun_behind_rain_cloud,
        size: 100,
      ),
    },
    "hourlyForecast": [
      {"time": "10:00 AM", "temperature": 22, "icon": Iconify(Twemoji.sun)},
      {"time": "11:00 AM", "temperature": 23, "icon": Iconify(Twemoji.sun)},
      {"time": "12:00 PM", "temperature": 25, "icon": Iconify(Twemoji.sun)},
      {
        "time": "1:00 PM",
        "temperature": 26,
        "icon": Iconify(Twemoji.sun_behind_cloud)
      },
      {
        "time": "2:00 PM",
        "temperature": 24,
        "icon": Iconify(Twemoji.sun_behind_cloud)
      },
      {"time": "3:00 PM", "temperature": 22, "icon": Iconify(Twemoji.cloud)},
      {
        "time": "4:00 PM",
        "temperature": 20,
        "icon": Iconify(Twemoji.cloud_with_rain)
      },
      {
        "time": "5:00 PM",
        "temperature": 19,
        "icon": Iconify(Twemoji.cloud_with_lightning_and_rain)
      },
    ],
    "weeklyForecast": [
      {
        "day": "Mon",
        "highTemp": 30,
        "lowTemp": 20,
        "icon": Iconify(Twemoji.sun)
      },
      {
        "day": "Tue",
        "highTemp": 28,
        "lowTemp": 18,
        "icon": Iconify(Twemoji.cloud)
      },
      {
        "day": "Wed",
        "highTemp": 26,
        "lowTemp": 19,
        "icon": Iconify(Twemoji.sun_behind_cloud)
      },
      {
        "day": "Thu",
        "highTemp": 27,
        "lowTemp": 18,
        "icon": Iconify(Twemoji.cloud_with_rain)
      },
      {
        "day": "Fri",
        "highTemp": 29,
        "lowTemp": 21,
        "icon": Iconify(Twemoji.sun)
      },
      {
        "day": "Sat",
        "highTemp": 30,
        "lowTemp": 22,
        "icon": Iconify(Twemoji.sun)
      },
      {
        "day": "Sun",
        "highTemp": 28,
        "lowTemp": 20,
        "icon": Iconify(Twemoji.cloud)
      }
    ]
  };
}
