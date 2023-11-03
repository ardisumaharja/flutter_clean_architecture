import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnd_clean_architecture/application/pages/weather/bloc/weathers_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  static const routeName = '/weathers';

  @override
  Widget build(BuildContext context) {
    return WeathersView();
  }
}

class WeathersView extends StatelessWidget {
  const WeathersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Weather')),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {},
        ));
  }
}
