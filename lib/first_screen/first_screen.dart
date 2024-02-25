import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudge/resources/theme_constants.dart';
import 'package:google_fonts/google_fonts.dart';

part 'details_bar.dart';
part 'chart_data.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: [
          DetailsBar(),
           ChartDataWidget()
         ],
        ),
      ),
    );
  }


}
