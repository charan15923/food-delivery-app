import 'dart:async';

import 'package:app_logger/app_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

import 'service_locator.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setupDependencies();
      await Future.wait([
        ScreenUtil.ensureScreenSize(),
      ]);

      unawaited(
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp],
        ),
      );
      if (kDebugMode) {
        Bloc.observer = TalkerBlocObserver(
          settings: const TalkerBlocLoggerSettings(
            printEventFullData: false,
            printChanges: true,
            printClosings: true,
            printCreations: true,
            printTransitions: false,
          ),
        );
      }

      runApp(await builder());
    },
    (exception, stackTrace) async {
      FlutterError.onError = (details) {
        AppLogger.logger.handle(details.exceptionAsString(), details.stack);
      };
    },
    zoneSpecification: ZoneSpecification(
      print: (self, parent, zone, line) {
        assert(
          () {
            zone.parent?.print(line);
            return true;
          }(),
          '',
        );
      },
    ),
  );
}
