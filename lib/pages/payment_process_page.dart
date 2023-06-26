import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/pages/main_page.dart';

class PaymentProcessPage extends StatefulWidget {
  const PaymentProcessPage({Key? key}) : super(key: key);

  @override
  State<PaymentProcessPage> createState() => _PaymentProcessPageState();
}

class _PaymentProcessPageState extends State<PaymentProcessPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(
            initial: 1,
          ),
        ),
        (r) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Image.asset("assets/payment.png"),
      )),
    );
  }
}
