
part of 'first_screen.dart';
class ChartDataWidget extends StatefulWidget {
 const ChartDataWidget({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<ChartDataWidget> with SingleTickerProviderStateMixin{
 late AnimationController _controller;
 late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(_controller);

    _controller.forward();
  }

 @override
 void dispose() {
   _controller.dispose();
   super.dispose();
 }

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Performance Chart".toUpperCase(),style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 12),),
Image.asset("assets/icons/more.png")
            ],
          ),
        ),
        const SizedBox(height: 20,),
        SlideTransition(
          position: _animation,
          child: AspectRatio(
            aspectRatio: 16/9,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  BarChart(
                    randomData(),
                  ),
              AspectRatio(
                  aspectRatio: 16/9,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(
                            touchTooltipData: LineTouchTooltipData(
                              maxContentWidth: 100,
                              tooltipBgColor: Colors.black,
                              getTooltipItems: (touchedSpots) {
                                return touchedSpots.map((LineBarSpot touchedSpot) {
                                  final textStyle = TextStyle(
                                    color: touchedSpot.bar.gradient?.colors[0] ??
                                        touchedSpot.bar.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  );
                                  return LineTooltipItem(
                                    '${touchedSpot.x}, ${touchedSpot.y.toStringAsFixed(2)}',
                                    textStyle,
                                  );
                                }).toList();
                              },
                            ),
                            handleBuiltInTouches: true,
                            getTouchLineStart: (data, index) => 0,
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              color: Color(0xff147AD6),
                              spots: [
                                FlSpot(10, 350),
                                FlSpot(20, 300),
                                FlSpot(30,480),
                                FlSpot(40, 300),
                                FlSpot(50, 250),
                                FlSpot(60, 150),
                              ],
                              isCurved: true,
                              isStrokeCapRound: false,
                              barWidth: 2,
                              belowBarData: BarAreaData(
                                show: false,
                              ),
                              dotData: const FlDotData(show: false),
                            ),
                          ],
                          minY: 0,
                          maxY: 500,
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize:50,
                         getTitlesWidget: (value, meta) =>
                                leftTitleWidgets(value, meta, constraints.maxWidth),
                              ),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles:const AxisTitles(
                              sideTitles: SideTitles(
                              ),
                              drawBelowEverything: true,
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          gridData:const FlGridData(
                            show: false,
                          ),
                          borderData: FlBorderData(show: false),
                        ),
                      );})),
            AspectRatio(
              aspectRatio: 16/9,
              child: ScatterChart(
                ScatterChartData(
                  scatterSpots:[
                    ScatterSpot(
                    3,
             480,
              dotPainter: FlDotCirclePainter(
           color: Color(0xff147AD6),
                radius: 5,
              ),
            )
                  ] ,
                  minX: 0,
                  maxX: 6,
                  minY: 0,
                  maxY: 500,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  gridData: const FlGridData(
                    show: false,
                  ),
                  titlesData: const FlTitlesData(
                    show: false,

                  ),
                  scatterTouchData: ScatterTouchData(
                    enabled: false,
                  ),
                ),
                swapAnimationDuration: const Duration(milliseconds: 600),
                swapAnimationCurve: Curves.fastOutSlowIn,
              ),
            ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y,
      ) {
    return BarChartGroupData(

      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color:  Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.zero,
          width:( MediaQuery.of(context).size.width*0.9)/7,
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    TextStyle style =  const TextStyle(
      color:  Color(0XFF7C828A),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    List<String> days = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',];

    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
  Widget customGetTitle(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: TextStyle(color: Color(0XFF7C828A)),
      ),
    );
  }
  BarChartData randomData() {
    return BarChartData(// S
      maxY: 500.0,
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 35,
          ),
        ),
        leftTitles:  AxisTitles(

          sideTitles: SideTitles(
            interval: 250,
            getTitlesWidget: customGetTitle,
            reservedSize: 40,
            showTitles: true,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),

      gridData: const FlGridData(show: false),
      barGroups: List.generate(
        6,
            (i) => makeGroupData(
          i,
          540,
        ),
      ),
    );
  }


    Widget leftTitleWidgets(double value, TitleMeta meta, double chartWidth) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 16,
        child: SizedBox(),
      );
    }


}