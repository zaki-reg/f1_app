import 'package:f1_app/data/models/driver.dart';
import 'package:f1_app/data/services/drivers_service.dart';

class DriversRepository {
  final DriversService driversService;

  DriversRepository({required this.driversService});

  Future<List<Driver>> getAllDrivers() async {
    final drivers = await driversService.getAllDrivers();
    return drivers.map((driver) => Driver.fromJson(driver)).toList();
  }
}
