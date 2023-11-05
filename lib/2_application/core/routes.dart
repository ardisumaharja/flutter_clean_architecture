import 'package:go_router/go_router.dart';
import 'package:rnd_clean_architecture/1_domain/entities/entities.dart';
import 'package:rnd_clean_architecture/2_application/pages/sign_in/sign_in_page.dart';
import 'package:rnd_clean_architecture/2_application/pages/sign_up/sign_up_page.dart';

import '../pages/pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: SplashPage.routeName,
  routes: [
    GoRoute(
      path: SplashPage.routeName,
      name: 'splashPage',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: SignInPage.routeName,
      name: 'signIn',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: SignUpPage.routeName,
      name: 'signUp',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: WeatherPage.routeName,
      name: 'weatherPage',
      builder: (context, state) => const WeatherPage(),
    ),
    GoRoute(
      path: WeatherDetailPage.routeName,
      name: 'weatherDetailPage',
      builder: (context, state) => WeatherDetailPage(
        weather: state.extra as WeatherEntity,
      ),
    ),
  ],
);
