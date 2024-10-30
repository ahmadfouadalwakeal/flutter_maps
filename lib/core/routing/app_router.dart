import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/core/routing/routes.dart';
import 'package:flutter_maps/features/map/data/repos/maps_repo.dart';
import 'package:flutter_maps/features/map/data/web_services/places_web_services.dart';
import 'package:flutter_maps/features/map/logic/cubit/maps_cubit.dart';

import '../../features/login/logic/phone_auth_cubit/phone_auth_cubit.dart';
import '../../features/login/login/login_screen.dart';
import '../../features/map/ui/map_screen.dart';
import '../../features/otp/ui/otp_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => MapsCubit(MapsRepo(PlacesWebServices())),
            child: MapScreen(),
          ),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );

      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
    }
  }
}
