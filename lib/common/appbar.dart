// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonappbar() => Row(
      children: [
        Container(
          height: 40,
          width: 40,
          child: SvgPicture.asset("assets/logo/plantlogo.svg"),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "intro1 title".tr,
          style: GoogleFonts.lato(
            color: Colors.green.shade900,
            fontSize: 25,
          ),
        ),
      ],
    );
