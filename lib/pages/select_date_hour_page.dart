import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/select_seat_page.dart';

class SelectDateHourPage extends StatefulWidget {
  final Movie movie;
  const SelectDateHourPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<SelectDateHourPage> createState() => _SelectDateHourPageState();
}

class _SelectDateHourPageState extends State<SelectDateHourPage> {
  final now = DateTime.now();
  int selected = 0;
  int selectedTime = 0;
  String selectedCinema = "";
  List<Widget> dates = [];
  List<Color> listColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<Color> listSelectedTimeColor = [];

  setActiveSelectedDateColor(int index) {
    resetColors();
    setState(() {
      listColor[index] = Colors.blue;
      selected = index;
      dates = getDateWidget();
    });
  }

  resetColors() {
    listColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  List<Widget> getDateWidget() {
    List<Widget> tempDates = [];
    for (int x = 0; x < 7; x++) {
      var today = DateTime(now.year, now.month, now.day + x);
      String dayWeek = DateFormat('E').format(today);
      String dayDate = DateFormat('d').format(today);
      tempDates.add(GestureDetector(
        onTap: () {
          setActiveSelectedDateColor(x);
        },
        child: Container(
          height: 150,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: listColor[x]),
          child: Text(
            "$dayWeek \n $dayDate",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ));
      tempDates.add(const SizedBox(
        width: 10,
      ));
    }
    return tempDates;
  }

  List<Widget> getTimeWidget(String cinema, int cinemaCount) {
    int startTime = 10;
    List<Widget> tempTime = [];

    for (int x = 0; x < 7; x++) {
      listSelectedTimeColor.add(Colors.white);
      int hourPlay = (startTime + x * 2);
      int currentHour = 0;
      if (selected == 0) {
        currentHour = int.parse(DateFormat('H').format(now));
      }

      tempTime.add(GestureDetector(
        onTap: hourPlay <= currentHour
            ? null
            : () {
                setState(() {
                  for (int j = 0; j < listSelectedTimeColor.length; j++) {
                    listSelectedTimeColor[j] = Colors.white;
                  }
                  listSelectedTimeColor[x + cinemaCount * 7] = Colors.blue;
                  selectedTime = hourPlay;
                  selectedCinema = cinema;
                });
              },
        child: Container(
          alignment: Alignment.center,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: hourPlay <= currentHour
                  ? Colors.grey
                  : listSelectedTimeColor[x + cinemaCount * 7]),
          child: Text(
            "${startTime + x * 2}:00",
            textAlign: TextAlign.center,
          ),
        ),
      ));

      tempTime.add(const SizedBox(
        width: 10,
      ));
    }
    return tempTime;
  }

  List<Widget> getCinemas(List<String> listCinema) {
    List<Widget> result = [];
    for (int x = 0; x < listCinema.length; x++) {
      result.add(const SizedBox(
        height: 16,
      ));
      result.add(Text(
        listCinema[x],
        style: const TextStyle(fontSize: 20),
      ));
      result.add(const SizedBox(
        height: 10,
      ));
      result.add(SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: getTimeWidget(listCinema[x], x),
        ),
      ));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    dates.addAll(getDateWidget());
    setActiveSelectedDateColor(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "chooseDate",
                style: TextStyle(fontSize: 20),
              ).tr(),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: dates,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getCinemas([
                  "CGV 23 Paskal Hyper Square",
                  "CGV Paris Van Java",
                  "XXI Cihampelas Walk",
                  "XXI Bandung Trade Center"
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: selectedCinema == ""
                          ? null
                          : () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectSeatPage(
                                      movie: widget.movie,
                                      date: DateTime(now.year, now.month,
                                          now.day + selected),
                                      hour: selectedTime,
                                      cinema: selectedCinema,
                                    ),
                                  ));
                            },
                      child: const Text("Buy Ticket").tr()))
            ],
          ),
        ),
      )),
    );
  }
}
