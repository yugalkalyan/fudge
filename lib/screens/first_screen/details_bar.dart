part of 'first_screen.dart';
class DetailsBar extends StatelessWidget {
  const DetailsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      decoration:const BoxDecoration(
          color: Color(0xff171D3C),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height:70 ,),
          Padding(
            padding: const EdgeInsets.only(left: 23,right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Hola, ',
                          style:  GoogleFonts.roboto(fontSize: 20,color: ThemeConstants.white,fontWeight: FontWeight.w600),
                          children:  <TextSpan>[
                            TextSpan(text: "Mihael",style: GoogleFonts.roboto(fontSize: 20,color: ThemeConstants.white,fontWeight: FontWeight.normal)),

                          ],
                        ),
                      ),
                      Text("Te tenemos excelentes noticias para ti",style:GoogleFonts.roboto(fontSize: 10,color: ThemeConstants.white,) ,)
                    ],
                  ),
                ),
                SvgPicture.asset("assets/icons/bell.svg",color: ThemeConstants.white,),
                const SizedBox(width: 23,),
                Image.asset("assets/icons/2.png")
              ],
            ),
          ),
          const SizedBox(height: 36,),
          Text("\$56,271.68",style:GoogleFonts.roboto(fontSize: 34,color: ThemeConstants.white,fontWeight: FontWeight.bold), ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("+\$9,736",style:GoogleFonts.roboto(fontSize: 15,color: ThemeConstants.white)),
              const SizedBox(width: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/arrow_up.svg",color: Color(0xff3CD942),),
                  const SizedBox(width: 7,),
                  Text("2.3%",style: GoogleFonts.roboto(fontSize: 15,color: Color(0xff3CD942)),)

                ],
              ),
            ],),
          const  SizedBox(height: 6,),
          Text("ACCOUNT BALANCE",style:GoogleFonts.roboto(fontSize: 12,color: ThemeConstants.lightWhite), ),
          const  SizedBox(height: 38,),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                _heading(value:"12",heading: "Following"),
                const VerticalDivider(color: ThemeConstants.white,),
                _heading(value:"36",heading: "Transactions"),
                const VerticalDivider(color: ThemeConstants.white,),
                _heading(value:"4",heading: "Bills"),
              ],
            ),
          ),
          const SizedBox(height: 30,)


        ],
      ),
    );
  }

}
Widget _heading({required String value,required String heading}){
  return   Column(children: [
    Text(value,style:GoogleFonts.roboto(fontSize: 18,color: ThemeConstants.white,fontWeight: FontWeight.bold)),
    Text(heading,style: GoogleFonts.roboto(fontSize: 12,color: ThemeConstants.lightWhite),),
  ],);
}
