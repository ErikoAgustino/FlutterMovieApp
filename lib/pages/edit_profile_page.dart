import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/service/auth_services.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage> {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  late String beforeFullName;

  checkChanges() async {
    AuthServices.auth.userChanges().listen((user) {
      if (user!.displayName != beforeFullName) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    userIdController.text = AuthServices.auth.currentUser!.uid;
    emailController.text = AuthServices.auth.currentUser!.email!;
    fullNameController.text = AuthServices.auth.currentUser!.displayName!;
    beforeFullName = AuthServices.auth.currentUser!.displayName!;
    checkChanges();
  }

  updateFullName() async {
    if (userIdController.text.isNotEmpty &&
        fullNameController.text.isNotEmpty) {
      await AuthServices.updateFullName(
          userIdController.text, fullNameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'editYourProfile',
                        style: TextStyle(fontSize: 24),
                      ).tr()),
                  const Icon(
                    Icons.account_circle,
                    size: 120,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: userIdController,
                      readOnly: true,
                      enabled: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User ID',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'email'.tr(),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: fullNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'fullName'.tr(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 50,
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                          onPressed: beforeFullName == fullNameController.text
                              ? null
                              : () => updateFullName(),
                          child: const Text(
                            'updateProfile',
                            style: TextStyle(fontSize: 18),
                          ).tr())),
                ],
              )),
        ),
      ),
    );
  }
}
