import 'package:dio/dio.dart';
import 'package:solar_system/data/models/solar_system_model.dart';

class SolarSytemRepository {
  final Dio dio;
  SolarSytemRepository({required this.dio});

  Future<SolarSystemModel> getData() async {
    final Response response = await dio.get("");
    return SolarSystemModel.fromJson(response.data);
  }
}