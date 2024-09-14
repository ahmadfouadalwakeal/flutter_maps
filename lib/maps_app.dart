import 'package:flutter/material.dart';
import 'package:flutter_maps/core/routing/app_router.dart';
import 'package:flutter_maps/core/routing/routes.dart';

class MapsApp extends StatelessWidget {
  final AppRouter appRouter;
  const MapsApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
