import 'package:flutter/material.dart';
import 'package:movie_app/pages/now_playing_page.dart';
import 'package:movie_app/pages/upcoming_page.dart';

// ignore: must_be_immutable
class MorePage extends StatelessWidget {
  int initialPage;

  MorePage({Key? key, required this.initialPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tab = TabBar(
        onTap: (value) {},
        indicatorColor: Colors.grey,
        labelColor: Colors.black,
        tabs: const <Tab>[
          Tab(
            text: "Now Showing",
          ),
          Tab(
            text: "Upcoming",
          )
        ]);

    return SafeArea(
      child: DefaultTabController(
        initialIndex: initialPage,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: tab.preferredSize,
            child: Card(
              child: tab,
            ),
          ),
          body: const TabBarView(
            children: [NowPlayingPage(), UpcomingPage()],
          ),
        ),
      ),
    );
  }
}
