import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudge/resources/theme_constants.dart';
import 'package:fudge/screens/transactions_screen/transaction_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../all_blocs/top_users_bloc/top_users_bloc.dart';



part 'details_bar.dart';
part 'chart_data.dart';
part 'top_users.dart';
part 'recent_transactions.dart';
part 'financial_goal.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: [
          DetailsBar(),
           ChartDataWidget(),
           TopUsers(),
           RecentTransactionsWidget(),
           FinancialGoalWidget(),
         ],
        ),
      ),
    );
  }


}
