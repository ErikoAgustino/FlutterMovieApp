import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/active_ticket_page.dart';
import 'package:movie_app/pages/history_ticket_page.dart';
import 'package:movie_app/service/auth_services.dart';
import 'package:movie_app/service/firestore_service.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  final tab = TabBar(
      onTap: (value) {},
      indicatorColor: Colors.grey,
      labelColor: Colors.black,
      tabs: <Tab>[
        Tab(
          text: "activeTicket".tr(),
        ),
        Tab(
          text: "history".tr(),
        )
      ]);
  List<Map<String, dynamic>> ticketsData = [];

  getTickets() async {
    await FirestoreService.ticketsCollection
        .doc(AuthServices.auth.currentUser!.uid)
        .collection("order")
        .orderBy("date")
        .orderBy("time")
        .get()
        .then((value) => {
              // ignore: avoid_function_literals_in_foreach_calls
              value.docs.forEach((element) {
                Map<String, dynamic> tempData = element.data();
                tempData.addAll({'id': element.id});
                ticketsData.add(tempData);

                setState(() {});
              })
            });
  }

  @override
  void initState() {
    super.initState();
    getTickets();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: tab.preferredSize,
            child: Card(
              child: tab,
            ),
          ),
          body: TabBarView(
            children: [
              ActiveTicketPage(
                ticketsData: ticketsData,
              ),
              HistoryTicketPage(
                ticketsData: ticketsData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
