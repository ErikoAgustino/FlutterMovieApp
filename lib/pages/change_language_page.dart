import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

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
                  "changeLanguage",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ).tr()),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                context.setLocale(const Locale("en", "US"));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "English",
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(context.locale.languageCode == 'en'
                        ? Icons.check
                        : null)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                context.setLocale(const Locale("id"));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Indonesia",
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(context.locale.languageCode == 'id'
                        ? Icons.check
                        : null)
                  ],
                ),
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
