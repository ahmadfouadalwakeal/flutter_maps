import 'package:flutter/material.dart';
import 'package:flutter_maps/core/routing/routes.dart';
import 'package:flutter_maps/features/signin/ui/signin_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings setting) {
    final arguments = setting.arguments;
    switch (setting.name) {
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => const SignInScreen(),
        );
      default:
        return null;
    }
  }
}
