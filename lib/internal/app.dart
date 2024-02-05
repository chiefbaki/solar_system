import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/core/dio_settings/dio_settings.dart';
import 'package:solar_system/domain/repositories/solar_system_repository/solar_system_repository.dart';
import 'package:solar_system/features/bloc/solar_system/solar_system_bloc.dart';
import 'package:solar_system/features/presentation/screens/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => SolarSytemRepository(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => SolarSystemBloc(
            repository: RepositoryProvider.of<SolarSytemRepository>(context)),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ),
      ),
    );
  }
}
