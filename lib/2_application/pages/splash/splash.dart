import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnd_clean_architecture/2_application/app/cubit/auth_cubit.dart';
import 'package:rnd_clean_architecture/2_application/application.dart';
import 'package:rnd_clean_architecture/2_application/pages/sign_in/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthCubitInitial && state.isLoggedIn) {
        } else {}
      },
      builder: (context, state) {
        if (state is AuthCubitInitial && state.isLoggedIn) {
          return const WeatherPage();
        } else {
          return const SignInPage();
        }
      },
    );
  }
}
