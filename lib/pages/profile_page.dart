import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/change_language_page.dart';
import 'package:movie_app/pages/edit_profile_page.dart';
import 'package:movie_app/pages/topup_wallet_page.dart';
import 'package:movie_app/service/auth_services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  checkAuth() async {
    AuthServices.auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, "login");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                const Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.grey,
                ),
                Text(
                  AuthServices.auth.currentUser!.displayName!,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AuthServices.auth.currentUser!.email!,
                  style: const TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 106, 106, 106)),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(),
                        )).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.account_circle_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "editProfile",
                          style: TextStyle(fontSize: 15),
                        ).tr()
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1.0, color: Colors.grey),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TopupWalletPage(),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.wallet),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "myWallet",
                          style: TextStyle(fontSize: 15),
                        ).tr()
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1.0, color: Colors.grey),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangeLanguagePage(),
                        )).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.language),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "changeLanguage",
                          style: TextStyle(fontSize: 15),
                        ).tr()
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1.0, color: Colors.grey),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.contact_support),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "faq",
                          style: TextStyle(fontSize: 15),
                        ).tr()
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1.0, color: Colors.grey),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.thumb_up),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "rateMovieApp",
                          style: TextStyle(fontSize: 15),
                        ).tr()
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1.0, color: Colors.grey),
                GestureDetector(
                  onTap: () async {
                    await AuthServices.signOut();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.logout),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "logout",
                          style: TextStyle(fontSize: 15),
                        ).tr()
                      ],
                    ),
                  ),
                ),
                const Divider(height: 1.0, color: Colors.grey),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
