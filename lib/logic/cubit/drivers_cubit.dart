import 'package:f1_app/data/models/driver.dart';
import 'package:f1_app/data/repositories/drivers_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'drivers_state.dart';

class DriversCubit extends Cubit<DriversState> {
  final DriversRepository driversRepository;
  late List<Driver> drivers;

  DriversCubit(this.driversRepository) : super(DriversInitial());

  Future<void> getAllDrivers() async {
    try {
      final fetchedDrivers = await driversRepository.getAllDrivers();
      drivers = fetchedDrivers;
      emit(DriversLoaded(drivers));
    } catch (e) {
      emit(DriversError(error: 'Failed to load drivers'));
    }
  }
}
