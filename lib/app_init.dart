import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'common/features/multilngual/presentation/bloc/language_bloc.dart';
import 'common/features/multilngual/presentation/bloc/language_event.dart';
import 'core/config/app_size_util.dart';
import 'features/newspage/presentation/pages/news_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ScreenUtil.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LanguageBloc()..add(GetLanguage()),
        child:
            BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
          return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.selectedLanguage.value,
              localeResolutionCallback: (
                locale,
                supportedLocales,
              ) {
                return locale;
              },
              home: const NewsPage());
        }));
  }
}
