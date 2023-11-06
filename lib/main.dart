import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'package:united_market/constants.dart';
import 'package:united_market/route/notifier.dart';
import 'package:united_market/route/parser.dart';
import 'package:united_market/route/delegate.dart';

import 'package:united_market/state/app_state.dart';

// window width and height for Windows app
const double windowWidth = 600;
const double windowHeight = 800;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('United Market');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

void main() {
  setupWindow();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<PageNotifier>(create: (_) => PageNotifier()),
      ChangeNotifierProvider<AppSettingState>(create: (_) => AppSettingState()),
      //ChangeNotifierProvider<GameAppState>(create: (_) => GameAppState()),
    ], child: const MainApp());
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final setting = context.watch<AppSettingState>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouteInformationParser(),
      routerDelegate:
      AppRouterDelegate(notifier: Provider.of<PageNotifier>(context)),
      title: 'United Market',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: setting.themeMode,
      theme: ThemeData(
        colorSchemeSeed: setting.colorSelected.color,
        useMaterial3: setting.useMaterial3,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: setting.colorSelected.color,
        useMaterial3: setting.useMaterial3,
        brightness: Brightness.dark,
      ),
    );
  }
}
