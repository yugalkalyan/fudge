part of 'first_screen.dart';

class RecentTransactionsWidget extends StatefulWidget {
  const RecentTransactionsWidget({super.key});

  @override
  State<RecentTransactionsWidget> createState() => _RecentTransactionsWidgetState();
}

class _RecentTransactionsWidgetState extends State<RecentTransactionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transactions".toUpperCase(),
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TransactionScreen()));
                    },
                    child: Image.asset("assets/icons/more.png"))
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 23, left: 23, bottom: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icons/user_profile.png"),
                          const SizedBox(
                            width: 13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Doe",
                                style: GoogleFonts.roboto(),
                              ),
                              Text(
                                "United Kingdom",
                                style: GoogleFonts.roboto(fontSize: 12, color: Colors.black.withOpacity(0.3)),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "80,000 AED",
                                style: GoogleFonts.roboto(),
                              ),
                              Text(
                                "11 Aug 2021",
                                style: GoogleFonts.roboto(fontSize: 12, color: Colors.black.withOpacity(0.3)),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          index == 0
                              ? Image.asset(
                                  "assets/icons/in-progress.png",
                                )
                              : Image.asset(
                                  "assets/icons/check_circle_fill.png",
                                ),
                        ],
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
