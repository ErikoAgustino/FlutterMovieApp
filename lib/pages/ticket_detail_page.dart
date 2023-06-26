import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/service/strings.dart';

class TicketDetailPage extends StatelessWidget {
  final Map<String, dynamic> ticket;

  const TicketDetailPage({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            const Text(
              "ticketDetail",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ).tr(),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF192b4f),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 14, bottom: 14),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      Strings.imageUrl + ticket['moviePoster'],
                      width: 80.0,
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Container(
                      height: 110,
                      width: width * 0.6,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['movieTitle'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Color(0xfff7c974),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${ticket['cinema']},\nRegular, Studio 1",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  style: const TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                        text:
                                            "${ticket['ticketAmount']} ${'tickets'.tr()}: "),
                                    TextSpan(
                                        text: "${ticket['seatNumber']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ])),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${DateFormat('EEEE, d MMM y').format(DateTime.parse(ticket['date']))}, ${ticket['time']}:00",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 13),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 231, 231, 231),
              ),
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 14, bottom: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "orderID",
                        style:
                            TextStyle(color: Color.fromARGB(255, 94, 94, 94)),
                      ).tr(),
                      Text(
                        ticket['id'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "regularSeats",
                        style:
                            TextStyle(color: Color.fromARGB(255, 94, 94, 94)),
                      ).tr(),
                      RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                const TextSpan(
                                    text: "Rp 45,000",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: " x ${ticket['ticketAmount']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 94, 94, 94)),
                                )
                              ])),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "fee",
                        style:
                            TextStyle(color: Color.fromARGB(255, 94, 94, 94)),
                      ).tr(),
                      RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              style: const TextStyle(color: Colors.black),
                              children: [
                                const TextSpan(
                                    text: "Rp 1,500",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: " x ${ticket['ticketAmount']}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 94, 94, 94)),
                                )
                              ])),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "paid",
                        style:
                            TextStyle(color: Color.fromARGB(255, 94, 94, 94)),
                      ).tr(),
                      Text(
                        "Rp ${NumberFormat.currency(symbol: '').format(ticket['price'])}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
