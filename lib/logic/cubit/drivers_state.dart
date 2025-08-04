part of 'drivers_cubit.dart';

@immutable
sealed class DriversState {}

final class DriversInitial extends DriversState {}

final class DriversError extends DriversState {
  final String error;

  DriversError({required this.error});
}

final class DriversLoading extends DriversState {}

final class DriversLoaded extends DriversState {
  final List<Driver> drivers;

  DriversLoaded(this.drivers);
}
