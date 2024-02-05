import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_system/features/bloc/solar_system/solar_system_bloc.dart';
import 'package:solar_system/features/bloc/solar_system/solar_system_event.dart';
import 'package:solar_system/features/bloc/solar_system/solar_system_state.dart';
import 'package:solar_system/features/presentation/widgets/custom_text_btn.dart';
import 'package:solar_system/features/presentation/widgets/solar_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SolarSystemBloc>(context).add(SolarSystem());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SolarSystemBloc>(context);
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextBtn(
                  onPressed: () {
                    bloc.add(SolarSystemPlanets());
                  },
                  title: "Planets"),
              CustomTextBtn(
                  onPressed: () {
                    bloc.add(SolarSystemMoons());
                  },
                  title: "Satellite"),
              CustomTextBtn(
                  onPressed: () {
                    bloc.add(SolarSystemAsteroids());
                  },
                  title: "Asteroids"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage(
              "assets/imgs/background.jpg",
            ))),
        child: Center(
          child: BlocBuilder<SolarSystemBloc, SolarSystemState>(
            builder: (context, state) {
              debugPrint("work");
              if (state is SolarSystemLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                );
              } else if (state is SolarSystemSuccess) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: SolarCard(
                              name: state.model[index].name ?? "",
                              isPlanet: state.model[index].isPlanet ?? false,
                              alternativeName:
                                  state.model[index].alternativeName ?? "null",
                              bodyType: state.model[index].bodyType ?? "null",
                              discoveryDate:
                                  state.model[index].discoveryDate ?? "null",
                              eccentricity:
                                  state.model[index].eccentricity.toString()),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          height: 70,
                        );
                      },
                      itemCount: state.model.length),
                );
              } else if (state is SolarSystemError) {
                return Text(
                  state.error.toString(),
                  style: const TextStyle(color: Colors.white),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
