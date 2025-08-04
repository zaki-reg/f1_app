import 'package:f1_app/constants/strings.dart';
import 'package:f1_app/data/repositories/drivers_repository.dart';
import 'package:f1_app/data/services/drivers_service.dart';
import 'package:f1_app/logic/cubit/drivers_cubit.dart';
import 'package:f1_app/presentation/screens/character_details_screen.dart';
import 'package:f1_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late DriversRepository driversRepository;
  late DriversCubit driversCubit;

  AppRouter() {
    driversRepository = DriversRepository(driversService: DriversService());
    driversCubit = DriversCubit(driversRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => driversCubit,
                  child: HomeScreen(),
                ));
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
    return null;
  }
}
