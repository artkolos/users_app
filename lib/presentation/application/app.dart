import 'package:flutter/material.dart';
import 'package:users_app/presentation/application/theme/theme.dart';
import 'package:users_app/presentation/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Application extends StatelessWidget {
  Application({super.key});

  static const _enLocale = Locale('en');

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: lightTheme,
      locale: _enLocale,
      routerConfig: _appRouter.config(),
    );
  }
}
