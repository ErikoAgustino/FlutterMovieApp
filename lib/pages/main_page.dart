import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/profile_page.dart';
import 'package:movie_app/pages/tickets_page.dart';

class MainPage extends StatefulWidget {
  final int initial;
  const MainPage({Key? key, this.initial = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int movieIndex = 0;
  int currentPageIndex = 0;
  final List<Widget> pages = const [HomePage(), TicketsPage(), ProfilePage()];

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          currentIndex: currentPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: "home".tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.movie_filter), label: "tickets".tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.account_box_rounded),
                label: "profile".tr()),
          ]),
      body: SafeArea(child: pages.elementAt(currentPageIndex)),
    );
  }
}
