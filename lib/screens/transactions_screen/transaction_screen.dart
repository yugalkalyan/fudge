import 'package:debit_credit_card_widget/debit_credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fudge/resources/theme_constants.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
part 'card_widget.dart';
part 'transations_tab_view.dart';
part 'recent_transactions.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My saved cards",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold),),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 22),
          child: SvgPicture.asset("assets/icons/material_menu.svg"),
        )],
      ),
      body: Column(
        children: [
          CardWidget(),
          const SizedBox(height: 40,),
          TransactionsTabView()
        ],
      ),
    );
  }
}
