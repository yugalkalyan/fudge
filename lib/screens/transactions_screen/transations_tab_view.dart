part of 'transaction_screen.dart';

class TransactionsTabView extends StatefulWidget {
  const TransactionsTabView({super.key});

  @override
  State<TransactionsTabView> createState() => _TransactionsTabViewState();
}

class _TransactionsTabViewState extends State<TransactionsTabView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(
                    text: "Menu Title 1",
                  ),
                  Tab(text: "Menu Title 2"),
                  Tab(text: "Menu Title 3"),
                  Tab(text: "Menu Title 4"),
                ],
                dividerColor: Colors.grey,
                labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: Colors.black),
                unselectedLabelStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold, color: Colors.grey),
                indicator: MaterialIndicator(
                    color: Colors.grey, paintingStyle: PaintingStyle.fill, topLeftRadius: 0, topRightRadius: 0),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RecentTransactionsWidget(),
                  RecentTransactionsWidget(),
                  RecentTransactionsWidget(),
                  RecentTransactionsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
