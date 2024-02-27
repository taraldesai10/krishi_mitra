import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi_mitra/common/appbar.dart';
import 'package:krishi_mitra/common/theam.dart';
import 'package:krishi_mitra/common/weather.dart';
import 'package:krishi_mitra/screens/home_screen/crop_doctor/crop_doctor.dart';
import 'package:krishi_mitra/screens/news/news.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool shimmer = false;
  Future<void> refresh() {
    setState(
      () {
        shimmer = true;
      },
    );
    return Future.delayed(const Duration(seconds: 3)).then(
      (value) => setState(
        () {
          shimmer = false;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: comBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: shimmer
              ? Shimmer.fromColors(
                  baseColor: Colors.green.shade200,
                  highlightColor: Colors.green,
                  child: homePage(),
                )
              : homePage(),
        ),
      ),
    );
  }

  Widget homePage() {
    return Column(
      children: [
        commonappbar(),
        const Weather(),
        Container(
          height: 260,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeButtons(
                      image: "assets/icons/stethoscope.svg",
                      text: "crop doctor",
                      tap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CropDoctor(),
                          ),
                        );
                        return (snack) {};
                      }),
                  homeButtons(
                    image: "assets/icons/news-paper-svgrepo-com.svg",
                    text: "news",
                    tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const News(),
                        ),
                      );
                      return (snack) {};
                    },
                  ),
                  homeButtons(
                    image: "assets/icons/Expert.svg",
                    text: "expert articles",
                    tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const News(),
                        ),
                      );
                      return (snack) {};
                    },
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  homeButtons(
                    image: "assets/icons/gov.svg",
                    text: "government",
                    tap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const News(),
                        ),
                      );
                      return (snack) {};
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget homeButtons(
    {required String image,
    required String text,
    required OnTap Function() tap}) {
  return SizedBox(
    width: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: tap,
          child: Container(
            // margin: EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(13),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.green.shade800,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(image),
          ),
        ),
        AutoSizeText(
          textAlign: TextAlign.center,
          text.tr,
          maxLines: 2,
          minFontSize: 10,
          maxFontSize: 13,
          style: GoogleFonts.lato(
            color: Colors.green.shade900,
          ),
        )
      ],
    ),
  );
}
