import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import '../../../widget/simple_text.dart';

class DashboardLineChart extends StatelessWidget {
  const DashboardLineChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.shortestSide / 2) + 25,
      width: (MediaQuery.of(context).size.width - 50) / 2,
      margin: const EdgeInsets.only(left: 0, right: 4),
      padding: const EdgeInsets.only(left: 11, top: 8, bottom: 21),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: AppColors.lightningbackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SimpleText(
            'Consumption\nsummary ',
            weight: FontWeight.w600,
            size: 12,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 4),
              const SimpleText(
                'Energy Consumption',
                weight: FontWeight.w400,
                size: 10,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 4),
              const SimpleText(
                'Active Meter Connections',
                weight: FontWeight.w400,
                size: 10,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: LineChart(
              sampleData1(),
              swapAnimationDuration:
                  const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          ),
        ],
      ),
    );
  }
}

LineChartData sampleData1() {
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.black.withOpacity(0.8),
      ),
      touchCallback: (LineTouchResponse touchResponse) {},
      handleBuiltInTouches: true,
    ),
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
      leftTitles: SideTitles(
        showTitles: false,
        margin: 0,
      ),
      bottomTitles: SideTitles(
        showTitles: false,
        reservedSize: 22,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 4,
        ),
        margin: 0,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: const Border(
        bottom: BorderSide(
          color: Color(0xff4e4965),
          width: 0,
        ),
        left: BorderSide(
          color: Colors.transparent,
        ),
        right: BorderSide(
          color: Colors.transparent,
        ),
        top: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    minX: 0,
    maxX: 14,
    maxY: 4,
    minY: 0,
    lineBarsData: linesBarData1(),
  );
}

List<LineChartBarData> linesBarData1() {
  final LineChartBarData lineChartBarData1 = LineChartBarData(
    spots: [
      FlSpot(1, 3),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(9, 1.4),
      FlSpot(10, 5),
      FlSpot(12, 3.2),
    ],
    isCurved: true,
    colors: [
      const Color.fromRGBO(0, 167, 167, 1),
    ],
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(
      show: false,
    ),
  );
  final LineChartBarData lineChartBarData2 = LineChartBarData(
    spots: [
      FlSpot(0, 0),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(8, 2.2),
      FlSpot(10, 5.8),
      FlSpot(12, 1.6),
    ],
    isCurved: true,
    colors: [
      const Color.fromRGBO(24, 160, 251, 0.5),
    ],
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: false,
    ),
    belowBarData: BarAreaData(show: false, colors: [
      const Color(0x00aa4cfc),
    ]),
  );

  return [
    lineChartBarData1,
    lineChartBarData2,
  ];
}
