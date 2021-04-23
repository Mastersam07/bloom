import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/ui_helpers.dart';
import '../../widget/simple_text.dart';
import 'widgets/dashboard_bar_chart.dart';
import 'widgets/dashboard_box_widgets.dart';
import 'widgets/dashboard_line_chart_widget.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 22,
                    backgroundImage: userImageAsset,
                  ),
                  trailing: Stack(
                    children: [
                      const Image(
                        image: notificationBellIconAsset,
                        height: 25,
                        width: 25,
                      ),
                      Positioned(
                        top: 1,
                        right: 2,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.notificationBellDot,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SimpleText(
                      'Welcome Akin',
                      textAlign: TextAlign.end,
                      size: 24,
                      weight: FontWeight.w600,
                    ),
                    const Image(
                      image: handImageAsset,
                      height: 34,
                    )
                  ],
                ),
                const SizedBox(height: 4),
                const SimpleText(
                  '''Here is the data for the'''
                  ''' power consumption from the six geopolitical zones''',
                  size: 14,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const DashBoardBoxes1(
                      image: lightningImageAsset,
                      title: 'Energy COnsumption',
                      measurement: '413',
                      unit: 'kw/h',
                    ),
                    const SizedBox(width: 8),
                    const DashBoardBoxes1(
                      image: meterImageAsset,
                      title: 'Active\n Meter Connections',
                      measurement: '200',
                      unit: 'meters',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const SimpleText('Energy Data Visualizations'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const DashboardLineChart(),
                    const SizedBox(width: 8),
                    DashBoardBarChart(),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SimpleText(
                      'Energy Consumptions',
                      weight: FontWeight.w600,
                      size: 14,
                    ),
                    CountryListPick(
                      initialSelection: 'NG',
                      theme: CountryTheme(
                        isShowCode: false,
                        isShowTitle: false,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                const SimpleText(
                  'Average Energy \nConsumption',
                  weight: FontWeight.w500,
                  size: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
