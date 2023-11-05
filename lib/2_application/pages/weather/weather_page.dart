import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rnd_clean_architecture/1_domain/domain.dart';
import 'package:rnd_clean_architecture/2_application/application.dart';
import 'package:rnd_clean_architecture/2_application/pages/sign_in/sign_in_page.dart';
import 'package:rnd_clean_architecture/2_application/pages/weather/widget/card_item_skeleton.dart';
import 'package:rnd_clean_architecture/2_application/pages/weather/widget/card_item_weather.dart';
import 'cubit/weathers_cubit.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  static const routeName = '/weathers';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeathersCubit>(
      create: (context) => WeathersCubit(
        usecases: WeatherUsecases(
          repo: RepositoryProvider.of<WeatherRepo>(context),
        ),
      ),
      child: const WeathersView(),
    );
  }
}

class WeathersView extends StatefulWidget {
  const WeathersView({super.key});

  @override
  State<WeathersView> createState() => _WeathersViewState();
}

class _WeathersViewState extends State<WeathersView> {
  @override
  void initState() {
    context.read<WeathersCubit>().fetchWeathers(page: 1, perpage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Weathers',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.lightBlue,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                onPressed: () => FirebaseAuth.instance.signOut().then(
                      (value) => context.pushReplacement(SignInPage.routeName),
                    ),
                icon: const Icon(
                  Icons.login_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<WeathersCubit, WeathersState>(
          builder: (context, state) {
            if (state is WeathersLoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: state.weatherList.length,
                  itemBuilder: (context, index) {
                    final item = state.weatherList[index];
                    return CardItemWeather(
                      date: item.date,
                      temperature: item.temperature,
                      type: item.type,
                      icon: item.icon,
                      onPress: () {
                        context.push(WeatherDetailPage.routeName, extra: item);
                      },
                    );
                  },
                ),
              );
            } else if (state is WeathersLoadingState) {
              // for (int i = 0; i < 10; i++) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const CardItemSkeleton();
                  },
                ),
              );
              // }
            } else {
              return const Center(
                child: Text('tunggu ya'),
              );
            }
          },
        ));
  }
}
