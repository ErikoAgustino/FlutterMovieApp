import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/payment_process_page.dart';
import 'package:movie_app/pages/topup_wallet_page.dart';
import 'package:movie_app/service/auth_services.dart';
import 'package:movie_app/service/firestore_service.dart';
import 'package:movie_app/service/strings.dart';
import 'package:movie_app/util/utils.dart';

class CheckoutPage extends StatefulWidget {
  final Movie movie;
  final DateTime date;
  final int hour;
  final String cinema;
  final String seats;
  final int ticketAmount;

  const CheckoutPage(
      {Key? key,
      required this.movie,
      required this.date,
      required this.hour,
      required this.cinema,
      required this.seats,
      required this.ticketAmount})
      : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  double currentWallet = 0;

  getWallet() async {
    var snapshotData = await FirestoreService.walletCollection
        .doc(AuthServices.auth.currentUser!.uid)
        .get();
    if (snapshotData.exists) {
      setState(() {
        currentWallet = snapshotData.get("amount");
      });
    } else {
      FirestoreService.createUpdateWallet(
          AuthServices.auth.currentUser!.uid, 0);
    }
  }

  @override
  void initState() {
    super.initState();
    getWallet();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double totalPrice =
        widget.ticketAmount * 45000 + widget.ticketAmount * 1500;
    String dateNTime =
        "${DateFormat('EEEE, d MMM y').format(widget.date)}, ${widget.hour}:00";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              const Text(
                "checkoutMovie",
                style: TextStyle(fontSize: 20),
              ).tr(),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      Strings.imageUrl + widget.movie.poster_path,
                      width: 80.0,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    width: width * 0.6,
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.movie.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.movie.overview,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                              Utils.getRatingStar(widget.movie.vote_average),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("cinema",
                                style: TextStyle(color: Colors.grey[600]))
                            .tr(),
                        Text(widget.cinema)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("DateNTime",
                                style: TextStyle(color: Colors.grey[600]))
                            .tr(),
                        Text(dateNTime)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("seatNumbers",
                                style: TextStyle(color: Colors.grey[600]))
                            .tr(),
                        Text(widget.seats)
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("price", style: TextStyle(color: Colors.grey[600]))
                            .tr(),
                        Text("Rp 45,000.00 x ${widget.ticketAmount}")
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("fee", style: TextStyle(color: Colors.grey[600])),
                        Text("Rp 1,500.00 x ${widget.ticketAmount}")
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: TextStyle(color: Colors.grey[600])),
                        Text(
                          "Rp ${NumberFormat.currency(symbol: '').format(totalPrice)}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 10,
                endIndent: 10,
                color: Colors.grey,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("yourWallet",
                            style: TextStyle(color: Colors.grey[600]))
                        .tr(),
                    Text(
                      "Rp ${NumberFormat.currency(symbol: '').format(currentWallet)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: currentWallet < totalPrice
                              ? Colors.red
                              : Colors.blue),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: currentWallet < totalPrice
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TopupWalletPage(),
                              )).then((value) {
                            getWallet();
                          });
                        }
                      : () {
                          FirestoreService.createTicket(
                              AuthServices.auth.currentUser!.uid,
                              widget.movie.id,
                              widget.seats,
                              widget.cinema,
                              widget.date.toString(),
                              widget.hour,
                              widget.ticketAmount,
                              widget.movie.title,
                              widget.movie.poster_path,
                              widget.movie.backdrop_path,
                              widget.movie.vote_average,
                              totalPrice);
                          FirestoreService.createUpdateWallet(
                              AuthServices.auth.currentUser!.uid,
                              currentWallet - totalPrice);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const PaymentProcessPage(),
                              ));
                        },
                  child: currentWallet < totalPrice
                      ? const Text("topUpWallet").tr()
                      : const Text("checkoutNow").tr())
            ]),
          ),
        ),
      ),
    );
  }
}
