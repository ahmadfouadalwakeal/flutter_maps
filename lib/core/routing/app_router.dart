import 'package:flutter/material.dart';
import 'package:flutter_maps/core/routing/routes.dart';
import 'package:flutter_maps/features/login/ui/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings setting) {
    final arguments = setting.arguments;
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return null;
    }
  }
}
