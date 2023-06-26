import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/service/auth_services.dart';
import 'package:movie_app/service/firestore_service.dart';

class TopupWalletPage extends StatefulWidget {
  const TopupWalletPage({Key? key}) : super(key: key);

  @override
  State<TopupWalletPage> createState() => _TopupWalletPageState();
}

class _TopupWalletPageState extends State<TopupWalletPage> {
  final TextEditingController amountController = TextEditingController();
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

  topupWallet(double amount) {
    FirestoreService.createUpdateWallet(
        AuthServices.auth.currentUser!.uid, currentWallet + amount);
    getWallet();
  }

  @override
  void initState() {
    super.initState();
    getWallet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                alignment: Alignment.center,
                child: const Text(
                  "wallet",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ).tr()),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "totalSaldo",
              style: TextStyle(fontSize: 16),
            ).tr(),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Text("Rp "),
                Text(
                  NumberFormat.currency(symbol: '').format(currentWallet),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "topup",
              style: TextStyle(fontSize: 16),
            ).tr(),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  setState(() {});
                },
                controller: amountController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'amount'.tr(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "choosebyTemplate",
              style: TextStyle(fontSize: 16),
            ).tr(),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    amountController.text = "50000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 50,000"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    amountController.text = "100000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 100,000"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    amountController.text = "150000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 150,000"),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    amountController.text = "200000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 200,000"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    amountController.text = "250000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 250,000"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    amountController.text = "500000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 500,000"),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    amountController.text = "1000000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 1,000,000"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    amountController.text = "2500000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 2,500,000"),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    amountController.text = "5000000";
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Rp 5,000,000"),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: amountController.text.isEmpty
                      ? null
                      : double.parse(amountController.text) < 10000.0
                          ? null
                          : () {
                              double amount =
                                  double.parse(amountController.text);
                              topupWallet(amount);
                            },
                  child: const Text("topUpWallet").tr()),
            )
          ]),
        )),
      ),
    );
  }
}
