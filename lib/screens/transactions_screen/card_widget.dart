part of 'transaction_screen.dart';
class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  PageController controller=PageController(viewportFraction:0.9 );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.width)  * 0.56574,
          child: PageView.builder(
           controller:  controller,
            padEnds: false,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, i) {
              return  Container(
               margin: const EdgeInsets.only(left: 10),
                child: DebitCreditCardWidget(
                  cardHolderName: "John Doe",
                  cardNumber: "0000000000000000",
                  cardExpiry: "1224",
                  width: MediaQuery.of(context).size.width*0.9 ,
                  // ... other properties
                ),
              );
            },

          ),
        ),
        const SizedBox(height: 40,),
        Align(
          alignment: Alignment.center,
          child: _buildCircleIndicator(controller, 3),
        ),
      ],
    );

  }

  _buildCircleIndicator(PageController controller, int itemCount) {
    return SmoothPageIndicator(
      controller: controller,
      count: itemCount,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.black,
        dotColor: Colors.grey,
        radius: 7,
        spacing: 10,
        dotHeight: 7,
        dotWidth: 7,
      ),
    );
    // return     Padding(
    //   padding: EdgeInsets.only(bottom: 4),
    //   child: CirclePageIndicator(
    //     selectedDotColor: ThemeConstants.textColor,
    //     dotColor: ThemeConstants.messageColor,
    //     itemCount: itemCount,
    //     currentPageNotifier: _currentPageNotifier,
    //   ),
    // );
  }
}
