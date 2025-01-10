import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:users_app/injection.dart';
import 'package:users_app/presentation/application/app.dart';

void main() {
  runZonedGuarded(
    () async{
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies();
      runApp(Application());
    },
    (err, st) {
      Logger().e(err, stackTrace: st);
    },
  );
}
