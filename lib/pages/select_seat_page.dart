import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/checkout_page.dart';
import 'package:movie_app/pages/seats/seat_layout_state_model.dart';
import 'package:movie_app/pages/seats/seat_layout_widget.dart';
import 'package:movie_app/pages/seats/seat_state.dart';
import 'package:movie_app/service/firestore_service.dart';

class SelectSeatPage extends StatefulWidget {
  final Movie movie;
  final DateTime date;
  final int hour;
  final String cinema;

  const SelectSeatPage(
      {Key? key,
      required this.movie,
      required this.date,
      required this.hour,
      required this.cinema})
      : super(key: key);

  @override
  State<SelectSeatPage> createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  List<List<SeatState>> seatStates = [
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
    ],
    [
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
      SeatState.unselected,
      SeatState.unselected,
      SeatState.empty,
      SeatState.empty,
    ],
  ];

  List<List<int>> seats = [];

  getSets() async {
    var snapshotData = await FirestoreService.seatsCollection
        .doc(widget.movie.id.toString())
        .get();
    if (snapshotData.exists) {
      setState(() {
        seatStates =
            json.decode(snapshotData.get("seats").cast<List<SeatState>>());
      });
    } else {
      FirestoreService.createUpdateSeats(
          widget.movie.id, seatStates.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    // getSets();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/svg_unselected_bus_seat.png',
                width: 25,
                height: 25,
              ),
              const Text(
                "available",
                style: TextStyle(fontSize: 14),
              ).tr(),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                'assets/svg_sold_bus_seat.png',
                width: 25,
                height: 25,
              ),
              const Text(
                "unavailable",
                style: TextStyle(fontSize: 14),
              ).tr(),
              const SizedBox(
                width: 12,
              ),
              Image.asset(
                'assets/svg_selected_bus_seat.png',
                width: 25,
                height: 25,
              ),
              const Text(
                "yourSeat",
                style: TextStyle(fontSize: 14),
              ).tr(),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            height: 2,
            color: Colors.grey[850],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: SizedBox(
            width: double.maxFinite,
            height: 500,
            child: SeatLayoutWidget(
              onSeatStateChanged: (rowI, colI, currentState) {
                if (seats.length < 6) {
                  if (currentState == SeatState.selected) {
                    seats.add([colI, rowI]);
                    seatStates[colI][rowI] = SeatState.sold;
                  } else {
                    seats.removeWhere((element) =>
                        element.toString() == [colI, rowI].toString());
                    seatStates[colI][rowI] = SeatState.unselected;
                  }
                  setState(() {});
                } else {
                  seatStates[colI][rowI] = SeatState.unselected;
                }
              },
              stateModel: SeatLayoutStateModel(
                  seatSvgSize: 25,
                  cols: 16,
                  rows: 16,
                  currentSeatsState: seatStates,
                  pathUnSelectedSeat: 'assets/svg_unselected_bus_seat.png',
                  pathSelectedSeat: 'assets/svg_selected_bus_seat.png',
                  pathSoldSeat: 'assets/svg_sold_bus_seat.png',
                  pathDisabledSeat: 'assets/svg_disabled_bus_seat.png'),
            ),
          )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: 25,
                    color: Colors.grey[850],
                    alignment: Alignment.center,
                    child: const Text(
                      "cinemaScreenHere",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ).tr(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "totalPrice",
                              style: TextStyle(color: Colors.grey),
                            ).tr(),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: Text(
                                seats.isNotEmpty
                                    ? "Rp ${seats.length * 45000}"
                                    : "Rp -",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey[850],
                          width: 1,
                        ),
                        Column(
                          children: [
                            const Text(
                              "seats",
                              style: TextStyle(color: Colors.grey),
                            ).tr(),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: Text(
                                seats.isNotEmpty
                                    ? seatsToString(seats)
                                    : "noSeatSelected".tr(),
                                maxLines: 2,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(width / 1.5, 30)),
                    onPressed: seats.isEmpty
                        ? null
                        : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutPage(
                                    movie: widget.movie,
                                    cinema: widget.cinema,
                                    hour: widget.hour,
                                    date: widget.date,
                                    seats: seatsToString(seats),
                                    ticketAmount: seats.length,
                                  ),
                                ));
                          },
                    child: const Text(
                      "order",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).tr(),
                  ),
                ],
              ))
        ]),
      ),
    );
  }

  String seatsToString(List<List<int>> seats) {
    String result = "";
    int length = seats.length - 1;
    for (int x = 0; x < length; x++) {
      result +=
          "${String.fromCharCode(65 + seats.elementAt(x).elementAt(1))}${seats.elementAt(x).elementAt(0)}, ";
    }
    result +=
        "${String.fromCharCode(65 + seats.elementAt(length).elementAt(1))}${seats.elementAt(length).elementAt(0)}";
    return result;
  }
}
