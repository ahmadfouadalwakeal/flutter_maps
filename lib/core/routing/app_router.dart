import 'package:flutter/material.dart';
import 'package:flutter_maps/features/otp/ui/otp_screen.dart';

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
      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
        );
      default:
        return null;
    }
  }
}
