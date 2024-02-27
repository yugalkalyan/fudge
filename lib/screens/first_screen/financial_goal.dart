part of 'first_screen.dart';

class FinancialGoalWidget extends StatefulWidget {
  const FinancialGoalWidget({super.key});

  @override
  State<FinancialGoalWidget> createState() => _FinancialGoalWidgetState();
}

class _FinancialGoalWidgetState extends State<FinancialGoalWidget> {
  List<Color>colorList=[
    Colors.red,
    Colors.green,
    Colors.lightBlue
  ];

  int getRandomValue() {
    Random random = Random();
    return random.nextInt(90); // Generates values between 0 and 100 (inclusive)
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:  Text(
            "Financial Goals".toUpperCase(),
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 23, left: 23, bottom: 33),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "XX of total XX",
                      style: GoogleFonts.roboto(),
                    ),
                   const  SizedBox(height: 6,),
                Stack(
                  children: [
                    LinearProgressIndicator(
                      value: getRandomValue() /
                          100,
                      color: colorList[index],
                      backgroundColor:Colors.grey,)

                  ],
                )
                  ],
                ),
              );
            })
      ],
    );
  }
}
