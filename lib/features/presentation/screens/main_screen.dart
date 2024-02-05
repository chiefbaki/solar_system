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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextBtn(
                  onPressed: () {
                    BlocProvider.of<SolarSystemBloc>(context)
                        .add(SolarSystem());
                  },
                  title: "Planets"),
              CustomTextBtn(onPressed: () {}, title: "Satellite"),
              CustomTextBtn(onPressed: () {}, title: "Asteroids"),
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
              print("work");
              if (state is SolarSystemLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is SolarSystemSuccess) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: SolarCard(
                            name: state.model.bodies?[index].name ?? "null",
                            isPlanet:
                                state.model.bodies?[index].isPlanet ?? false,
                            alternativeName:
                                state.model.bodies?[index].alternativeName ??
                                    "null",
                            bodyType:
                                state.model.bodies?[index].bodyType ?? "null",
                            discoveryDate:
                                state.model.bodies?[index].discoveryDate ??
                                    "null",
                            eccentricity: state
                                    .model.bodies?[index].eccentricity
                                    .toString() ??
                                "null",
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          height: 50,
                        );
                      },
                      itemCount: state.model.bodies?.length ?? 0),
                );
              } else if (state is SolarSystemError) {
                return Text(state.error.toString(), style: const TextStyle(color: Colors.white),);
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
