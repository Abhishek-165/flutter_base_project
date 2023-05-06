import 'dart:async';

import 'package:flavour_clean_bloc/core/flavors/app_flavor_config.dart';
import 'package:flavour_clean_bloc/features/newspage/presentation/bloc/newspage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_init.dart';
import 'common/features/multilngual/data/local_language.dart';
import 'core/config/app_bloc_observer.dart';

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await FirebaseService.initializeFirebase();
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };
  // await FirebaseService.initializeFirebase();
  AppFlavorConfig.setFlavor(flavor: AppFlavor.dev);
  LocalLanguage.getInstance().init();
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(MultiBlocProvider(
      providers: [
        BlocProvider<NewspageBloc>(
            create: (BuildContext context) => NewspageBloc()),
      ],
      child: const MyApp(),
    ));
  }, (error, stackTrace) {});
}
