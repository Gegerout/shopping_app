import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/auth/presentation/states/signin_state.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SizedBox(
                width: 38,
                height: 38,
                child: Image.asset(
                  "assets/images/arrow-left-circle.png",
                )),
          ),
          title: Text(
            "Settings",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: const Color(0xFFF1C40F)),
          ),
          centerTitle: true,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset("assets/images/search_big.png"))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 66,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      backgroundColor: const Color(0xFFC4C4C4).withOpacity(0.35),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        "Your account",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                    )),
              ),
              const SizedBox(height: 12,),
              SizedBox(
                width: double.infinity,
                height: 66,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        backgroundColor: const Color(0xFFC4C4C4).withOpacity(0.35),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        "Your order",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                    )),
              ),
              const SizedBox(height: 12,),
              SizedBox(
                width: double.infinity,
                height: 66,
                child: ElevatedButton(
                    onPressed: () {
                      ref.read(signinProvider.notifier).deleteUser();
                    },
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        backgroundColor: const Color(0xFFE74C3C).withOpacity(0.6),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        "Sign out",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
