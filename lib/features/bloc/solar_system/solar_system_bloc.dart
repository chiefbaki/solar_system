import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/data/models/solar_system_model.dart';
import 'package:solar_system/domain/repositories/solar_system_repository/solar_system_repository.dart';
import 'package:solar_system/features/bloc/solar_system/solar_system_event.dart';
import 'package:solar_system/features/bloc/solar_system/solar_system_state.dart';

class SolarSystemBloc extends Bloc<SolarSystemEvent, SolarSystemState> {
  SolarSystemBloc({required this.repository}) : super(SolarSystemInitial()) {
    on<SolarSystem>((event, emit) async {
      emit(SolarSystemLoading());
      try {
        SolarSystemModel model = await repository.getData();
        emit(SolarSystemSuccess(model: model.bodies ?? []));
      } catch (e) {
        emit(SolarSystemError(error: e.toString()));
      }
    });

    on<SolarSystemPlanets>((event, emit) async {
      emit(SolarSystemInitial());
      try {
        SolarSystemModel model = await repository.getData();
        List<Bodies> planets =
            model.bodies!.where((element) => element.isPlanet == true).toList();
        emit(SolarSystemSuccess(model: planets));
      } catch (e) {
        emit(SolarSystemError(error: e.toString()));
      }
    });

    on<SolarSystemMoons>((event, emit) async {
      emit(SolarSystemLoading());
      try {
        SolarSystemModel model = await repository.getData();
        List<Bodies> moons = model.bodies!
            .where((element) => element.bodyType == "Moon")
            .toList();
        emit(SolarSystemSuccess(model: moons));
      } catch (e) {
        emit(SolarSystemError(error: e.toString()));
      }
    });

    on<SolarSystemAsteroids>((event, emit) async {
      emit(SolarSystemLoading());
      try {
        SolarSystemModel model = await repository.getData();
        List<Bodies> asteroids = model.bodies!
            .where((element) => element.bodyType == "Asteroid")
            .toList();
        emit(SolarSystemSuccess(model: asteroids));
      } catch (e) {
        emit(SolarSystemError(error: e.toString()));
      }
    });

    on<SolarSystemStars>((event, emit) async {
      emit(SolarSystemLoading());
      try {
        SolarSystemModel model = await repository.getData();
        List<Bodies> stars = model.bodies!
            .where((element) => element.bodyType == "Star")
            .toList();
        emit(SolarSystemSuccess(model: stars));
      } catch (e) {
        emit(SolarSystemError(error: e.toString()));
      }
    });


    on<SolarSystemComets>((event, emit) async {
      emit(SolarSystemLoading());
      try {
        SolarSystemModel model = await repository.getData();
        List<Bodies> comets = model.bodies!
            .where((element) => element.bodyType == "Comet")
            .toList();
        emit(SolarSystemSuccess(model: comets));
      } catch (e) {
        emit(SolarSystemError(error: e.toString()));
      }
    });
  }

  final SolarSytemRepository repository;
}
