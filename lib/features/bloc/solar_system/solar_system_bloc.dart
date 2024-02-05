import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/data/models/solar_system_model.dart';
import 'package:solar_system/domain/repositories/solar_system_repository/solar_system_repository.dart';
import 'package:solar_system/features/bloc/solar_system/solar_system_event.dart';
import 'package:solar_system/features/bloc/solar_system/solar_system_state.dart';

class SolarSystemBloc extends Bloc<SolarSystemEvent, SolarSystemState> {
  SolarSystemBloc({required this.repository}) : super(SolarSystemInitial()) {
    on<SolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoading());
      try {
        SolarSystemModel model = await repository.getData();
        emit(SolarSystemSuccess(model: model));
      } catch (e) {
        emit(SolarSystemError(error: e.toString()));
      }
    });
  }
  final SolarSytemRepository repository;
}
