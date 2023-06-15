import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/auth/presentation/pages/signup_page.dart';
import 'package:shopping_app/home/presentation/pages/home_page.dart';

import '../states/signin_state.dart';

class SigninPage extends ConsumerWidget {
  SigninPage({Key? key}) : super(key: key);

  final TextEditingController nameCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                const SizedBox(height: 114,),
                Center(
                    child: Text(
                  "Sign in",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: 25),
                )),
                const SizedBox(height: 90,),
                Container(
                  width: double.infinity,
                  height: 66,
                  decoration: BoxDecoration(
                      color: const Color(0xFFC4C4C4).withOpacity(0.35),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: TextFormField(
                      controller: nameCont,
                      onChanged: (value) {
                        ref.read(signinProvider.notifier).checkCreds(value, passwordCont.text);
                      },
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Username",
                        contentPadding: const EdgeInsets.only(left: 30, top: 33),
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 20),
                        border:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 36,),
                Container(
                  width: double.infinity,
                  height: 66,
                  decoration: BoxDecoration(
                      color: const Color(0xFFC4C4C4).withOpacity(0.35),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: TextFormField(
                      controller: passwordCont,
                      onChanged: (value) {
                        ref.read(signinProvider.notifier).checkCreds(nameCont.text, value);
                      },
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: "Password",
                        contentPadding: const EdgeInsets.only(left: 30, top: 33),
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 20),
                        border:
                            const OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: const Color(0xFFC0C0C0)),
                    )),
                const SizedBox(height: 110,),
                SizedBox(
                  width: double.infinity,
                  height: 66,
                  child: ElevatedButton(
                      onPressed: ref.watch(signinProvider).isValid ? () {
                        ref.read(signinProvider.notifier).loginUser(nameCont.text, passwordCont.text).then((value) {
                          if(value != null) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                          }
                          else {
                            showDialog(context: context, builder: (context) => AlertDialog(
                              title: const Text("Wrong credentials"),
                              actions: [
                                ElevatedButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: const Text("Ok"))
                              ],
                            ));
                          }
                        });
                      } : null,
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFFF1C40F),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      )),
                ),
                const SizedBox(height: 95,),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                    child: Text(
                      "Sign up menu",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: const Color(0xFFF1C40F)),
                    )),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
