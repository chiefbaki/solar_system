

import 'package:solar_system/data/models/solar_system_model.dart';

abstract class SolarSystemState {}

class SolarSystemInitial extends SolarSystemState {}

class SolarSystemLoading extends SolarSystemState {}

class SolarSystemSuccess extends SolarSystemState {
  final List<Bodies> model;
  SolarSystemSuccess({required this.model});
}

class SolarSystemError extends SolarSystemState {
  final String error;
  SolarSystemError({required this.error});
}
