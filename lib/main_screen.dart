import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'weather_data.dart';

WeatherData data = WeatherData();

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Text(
                "Weather UI",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              SizedBox(
                height: 30,
                width: 130,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    // Set transparency
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.grey, // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.white54),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0), // Hint text color
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.weatherData["city"],
                    style: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Icon(Icons.location_on_outlined, color: Colors.yellow[700]),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(child: data.weatherData["currentWeather"]["icon"]),
              Text(
                data.weatherData["currentWeather"]["temperature"].toString() +
                    " ℃",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 60),
              ),
              SizedBox(
                height: 70,
              ),
              SizedBox(
                height: 130,
                child: HourlyForecast(),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 250,
                child: WeeklyForecast(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.weatherData["hourlyForecast"].length,
      itemBuilder: (context, index) {
        var hourlyForecast = data.weatherData["hourlyForecast"][index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  hourlyForecast["time"],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                hourlyForecast["icon"],
                SizedBox(
                  height: 15,
                ),
                Text(
                  hourlyForecast["temperature"].toString() + "°C",
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (data.weatherData["weeklyForecast"].length / 2).ceil(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, rowIndex) {
        return Row(
          children: [
            _buildWeeklyItem(rowIndex * 2),
            if ((rowIndex * 2 + 1) < data.weatherData["weeklyForecast"].length)
              _buildWeeklyItem(rowIndex * 2 + 1),
          ],
        );
      },
    );
  }

  Widget _buildWeeklyItem(int index) {
    var weeklyForecast = data.weatherData["weeklyForecast"][index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 185,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(
            weeklyForecast["day"],
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          leading: weeklyForecast["icon"],
          trailing: Text(
            weeklyForecast["highTemp"].toString() +
                "°/" +
                weeklyForecast["lowTemp"].toString() +
                "°",
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
