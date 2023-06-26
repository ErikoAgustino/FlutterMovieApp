import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/ticket_detail_page.dart';
import 'package:movie_app/service/strings.dart';
import 'package:movie_app/util/utils.dart';

// ignore: must_be_immutable
class HistoryTicketPage extends StatelessWidget {
  final now = DateTime.now();
  final List<Map<String, dynamic>> ticketsData;

  HistoryTicketPage({Key? key, required this.ticketsData}) : super(key: key);

  Map<String, Movie> movieMap = {};

  List<Widget> getListTicketWidget(var context) {
    List<Widget> result = [];
    double width = MediaQuery.of(context).size.width;

    for (int x = 0; x < ticketsData.length; x++) {
      DateTime ticketDate = DateTime.parse(ticketsData[x]['date']);
      int year = int.parse(DateFormat('y').format(ticketDate));
      int month = int.parse(DateFormat('M').format(ticketDate));
      int day = int.parse(DateFormat('d').format(ticketDate));

      int yearNow = int.parse(DateFormat('y').format(now));
      int monthNow = int.parse(DateFormat('M').format(now));
      int dayNow = int.parse(DateFormat('d').format(now));
      int hourNow = int.parse(DateFormat('H').format(now));
      if ((year < yearNow) ||
          (year == yearNow && month < monthNow) ||
          month == monthNow &&
              (day < dayNow ||
                  (day == dayNow && hourNow > ticketsData[x]['time']))) {
        result.add(
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TicketDetailPage(ticket: ticketsData[x])));
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    Strings.imageUrl + ticketsData[x]['moviePoster'],
                    width: 80.0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 110,
                  width: width * 0.6,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ticketsData[x]['movieTitle'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            ticketsData[x]['cinema'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_activity_outlined,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Tickets (${ticketsData[x]['ticketAmount']})",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${DateFormat('EEEE, d MMM y').format(ticketDate)}, ${ticketsData[x]['time']}:00",
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: Utils.getRatingStar(
                            ticketsData[x]['movieVoteAverage']),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        result.add(const SizedBox(
          height: 10,
        ));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(children: getListTicketWidget(context))),
        ),
      ),
    );
  }
}
