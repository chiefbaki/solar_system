import 'package:flutter/material.dart';


class SolarCard extends StatefulWidget {
  final String name;
  final bool isPlanet;
  final String alternativeName;
  final String bodyType;
  final String discoveryDate;
  final String eccentricity;

  const SolarCard({
    super.key, required this.name, required this.isPlanet, required this.alternativeName, required this.bodyType, required this.discoveryDate, required this.eccentricity,
    
  });

  @override
  State<SolarCard> createState() => _SolarCardState();
}

class _SolarCardState extends State<SolarCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 190,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0XFF080707), Color(0xFF420979)],
            begin: Alignment.bottomCenter,
            end: Alignment.topRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: ${widget.name}",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "is planet? ${widget.isPlanet}",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "alternativeName: ${widget.alternativeName}}",
              style:const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "bodyType: ${widget.bodyType}",
              style:const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "discoveryDate: ${widget.discoveryDate}",
              style:const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "eccentricity: ${widget.eccentricity}",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
