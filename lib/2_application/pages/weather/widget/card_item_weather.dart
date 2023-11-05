import 'package:flutter/material.dart';
import 'package:rnd_clean_architecture/2_application/core/utils/extensions/string_extension.dart';

class CardItemWeather extends StatelessWidget {
  const CardItemWeather({
    super.key,
    required this.date,
    required this.temperature,
    required this.type,
    required this.icon,
    required this.onPress,
  });

  final String date;
  final double temperature;
  final String type;
  final String icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://openweathermap.org/img/wn/$icon@2x.png',
                width: 60,
                height: 60,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date.dateTimeFormat(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(type),
                  Text('Temp $temperature °C'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
