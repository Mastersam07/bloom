import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../widget/simple_text.dart';

// ignore: use_key_in_widget_constructors
class DashBoardBarChart extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<StatefulWidget> createState() => DashBoardBarChartState();
}

class DashBoardBarChartState extends State<DashBoardBarChart> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        height: (MediaQuery.of(context).size.shortestSide / 2) + 25,
        //  209,
        width: (MediaQuery.of(context).size.width - 50) / 2,
        // 150,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.lightningbackgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SimpleText(
              'Bar Chart ',
              weight: FontWeight.w600,
              size: 12,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BarChart(
                  mainBarData(),
                  swapAnimationDuration: animDuration,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const SimpleText(
              'Keys',
              weight: FontWeight.w600,
              size: 12,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const BarChartKeys(
                      keyTitle: 'NC',
                      color: AppColors.blueColor,
                    ),
                    const SizedBox(width: 8),
                    const BarChartKeys(
                      keyTitle: 'NW',
                      color: AppColors.orangeColor,
                    ),
                    const SizedBox(width: 8),
                    const BarChartKeys(
                      keyTitle: 'NE',
                      color: AppColors.darkBlueColor,
                    ),
                    const SizedBox(width: 8),
                    const BarChartKeys(
                      keyTitle: 'SW',
                      color: AppColors.keyColor,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const BarChartKeys(
                      keyTitle: 'SE',
                      color: AppColors.yellowColor,
                    ),
                    const SizedBox(width: 8),
                    const BarChartKeys(
                      keyTitle: 'SS',
                      color: AppColors.ashColor,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor,
    double width = 5,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: false,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(6, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 14,
                isTouched: i == touchedIndex, barColor: AppColors.key2Color);
          case 1:
            return makeGroupData(1, 17,
                isTouched: i == touchedIndex, barColor: AppColors.orangeColor);
          case 2:
            return makeGroupData(2, 13,
                isTouched: i == touchedIndex,
                barColor: AppColors.darkBlueColor);
          case 3:
            return makeGroupData(3, 12,
                isTouched: i == touchedIndex,
                barColor: AppColors.lightningbackgroundColor);
          case 4:
            return makeGroupData(4, 20,
                isTouched: i == touchedIndex, barColor: AppColors.yellowColor);
          case 5:
            return makeGroupData(5, 11.5,
                isTouched: i == touchedIndex, barColor: AppColors.ashColor);

          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
              }
              return BarTooltipItem(
                weekDay + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! PointerUpEvent &&
                barTouchResponse.touchInput is! PointerExitEvent) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
}

class BarChartKeys extends StatelessWidget {
  final Color color;
  final String keyTitle;
  const BarChartKeys({
    Key key,
    this.color,
    this.keyTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 4),
        SimpleText(
          keyTitle,
          size: 10,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}
