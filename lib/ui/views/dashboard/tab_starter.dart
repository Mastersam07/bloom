import 'package:bloom/ui/shared/colors.dart';
import 'package:bloom/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../account/account.dart';
import '../faq/faq.dart';
import '../settings/settings.dart';
import 'home.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() => setState(() {});
  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(controller: _tabController, children: [
          const Home(),
          const FAQSection(),
          const Account(),
          const Settings(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.navBarActiveItemColor,
          selectedIconTheme: const IconThemeData(
            color: AppColors.navBarActiveItemColor,
          ),
          currentIndex: _tabController.index,
          onTap: _onItemTapped,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: AppColors.hintTextColor,
                ),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: ImageIcon(
                  dashboardImageAsset,
                  color: AppColors.hintTextColor,
                ),
                label: 'FAQs'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: AppColors.hintTextColor,
                ),
                label: 'Account'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: AppColors.hintTextColor,
                ),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
