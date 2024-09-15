import 'package:flutter/material.dart';

import '../../features/login/ui/login_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings setting) {
    final arguments = setting.arguments;
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      default:
        return null;
    }
  }
}
