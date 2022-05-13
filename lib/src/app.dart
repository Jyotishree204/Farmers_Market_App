import 'package:farmers_market/src/blocks/auth_bloc.dart';
import 'package:farmers_market/src/routes.dart';
import 'package:farmers_market/src/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

final authBloc = AuthBloc();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(
        create: (context) => authBloc,
      )
    ], child: const PlatformApp());
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}

class PlatformApp extends StatelessWidget {
  const PlatformApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoApp(
        home: Login(),
        onGenerateRoute: Routes.cupertinoRoutes,
        theme: CupertinoThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      );
    } else {
      return MaterialApp(
        home: const Login(),
        onGenerateRoute: Routes.materialRoutes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      );
    }
  }
}
