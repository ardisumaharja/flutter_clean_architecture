import 'package:go_router/go_router.dart';

import '../pages/pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: WeatherPage.routeName,
  routes: [
    GoRoute(
      path: SplashPage.routeName,
      name: 'splashPage',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: WeatherPage.routeName,
      name: 'weatherPage',
      builder: (context, state) => const WeatherPage(),
    ),
    GoRoute(
      path: WeatherDetailPage.routeName,
      name: 'weatherDetailPage',
      builder: (context, state) => const WeatherDetailPage(),
    ),
  ],
);
