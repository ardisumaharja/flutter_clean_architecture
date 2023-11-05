import 'package:flutter/material.dart';
import 'package:rnd_clean_architecture/1_domain/domain.dart';
import 'package:rnd_clean_architecture/2_application/core/utils/extensions/string_extension.dart';

class WeatherDetailPage extends StatelessWidget {
  const WeatherDetailPage({super.key, required this.weather});

  final WeatherEntity weather;

  static const routeName = '/weatherDetail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Weather Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
        child: Center(
          child: Column(
            children: [
              Text(
                weather.date.dateFormat(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                weather.date.timeFormat(),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weather.temperature} °C',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 48),
                  ),
                  Image.network(
                    'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                    height: 100,
                    width: 100,
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                '${weather.type} (${weather.desc})',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Temp(min)',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '${weather.minTemp} °C',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Temp(max)',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '${weather.maxTemp} °C',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
