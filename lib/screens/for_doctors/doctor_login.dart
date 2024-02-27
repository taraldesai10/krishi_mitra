import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:krishi_mitra/screens/for_doctors/doctor_home_screen.dart';

import 'package:krishi_mitra/service/auth.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late FirebaseAuth auth = FirebaseAuth.instance;
  bool istrue = false;
  TextEditingController emailTxtController = TextEditingController();
  TextEditingController passTxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset("assets/lottie/doctor.json",
                    fit: BoxFit.cover, animate: true),
                const Text(
                  "Email verification",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: emailTxtController,
                      validator: MultiValidator([
                        EmailValidator(errorText: "please enter valid email"),
                        RequiredValidator(errorText: "please enter your email"),
                      ]).call,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.mail),
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passTxtController,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "please enter your password"),
                        MaxLengthValidator(10,
                            errorText: "only add 10 charecters")
                      ]).call,
                      onChanged: (value) {},
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.lock),
                        border: InputBorder.none,
                        hintText: "password",
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 165, 221, 166),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      // var sharedPref = await SharedPreferences.getInstance();
                      // sharedPref.setBool(SplashScreen.keyLogin, true);
                      if (key.currentState!.validate()) {
                        await auth
                            .handleSignInEmail(
                                emailTxtController.text, passTxtController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DoctorHomePage()));
                          // ignore: invalid_return_type_for_catch_error, avoid_print
                        }).catchError((e) => print(e));
                        setState(() {
                          // AuthController.doctorLogin();
                        });
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.green.shade900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
