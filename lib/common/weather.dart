import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'package:krishi_mitra/models/weather_model.dart';
import 'package:krishi_mitra/service/weather_service.dart';
import 'package:lottie/lottie.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String sunImage = "assets/lottie/sun.json";
  String sunnyImage = "assets/lottie/sunny.json";
  String coldImage = "assets/lottie/cold.json";

  final _weatherService = WeatherService("3d652bf196166b7031b3512541a6a2c7");
  WeatherModel? _weathermodel;
  String state = "";
  String? stateh;
  List addState = [];

  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);

      _weathermodel = weather;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(state.toString()),
        // Text(_weathermodel?.cityName ?? "loading city.."),
        Container(
          padding: const EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(vertical: 20),
          height: 130,
          decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(90)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: Lottie.asset(
                  (_weathermodel?.temperature.round() != null)
                      ? (_weathermodel!.temperature.round() > 30)
                          ? "Loading"
                          : (_weathermodel!.temperature.round() > 20)
                              ? sunnyImage
                              : coldImage
                      : sunnyImage,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "tempreture".tr,
                style: TextStyle(
                  color: Colors.green.shade200,
                  fontSize: 17,
                ),
              ),
              Text(
                (_weathermodel?.temperature.round() == null)
                    ? "loading.."
                    : "${_weathermodel?.temperature.round()}°C",
                style: TextStyle(
                  color: Colors.green.shade200,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
