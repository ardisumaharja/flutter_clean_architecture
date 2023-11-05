import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnd_clean_architecture/0_data/data.dart';
import 'package:rnd_clean_architecture/1_domain/domain.dart';
import 'package:rnd_clean_architecture/2_application/app/basic_app.dart';
import '2_application/app/cubit/auth_cubit.dart';
import '2_application/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await Firebase.initializeApp();

  if (!kIsWeb || !kDebugMode) {
    PlatformDispatcher.instance.onError = (error, stack) {
      return true;
    };
  }

  final authCubit = AuthCubit();

  FirebaseAuth.instance.authStateChanges().listen((user) {
    authCubit.authStateChanged(user: user);
  });

  runApp(
    RepositoryProvider<WeatherRepo>(
      create: (context) => WeatherRepoRemote(
        remoteSource: WeatherRemoteDatasourceImpl(),
      ),
      child: BlocProvider<AuthCubit>(
        create: (context) => authCubit,
        child: const BasicApp(),
      ),
    ),
  );
}
