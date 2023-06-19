import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/auth/presentation/pages/signin_page.dart';
import 'package:shopping_app/auth/presentation/states/signin_state.dart';
import 'package:shopping_app/core/states/main_state.dart';
import 'package:shopping_app/home/presentation/pages/home_page.dart';

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
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 66,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(page: 4)));
                    },
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        backgroundColor:
                            const Color(0xFFC4C4C4).withOpacity(0.35),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
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
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 66,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(page: 5)));
                    },
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        backgroundColor:
                            const Color(0xFFC4C4C4).withOpacity(0.35),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
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
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                height: 66,
                child: ElevatedButton(
                    onPressed: () {
                      ref.read(signinProvider.notifier).deleteUser();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SigninPage()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.centerLeft,
                        backgroundColor:
                            const Color(0xFFE74C3C).withOpacity(0.6),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
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

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(mainProvider).when(
        data: (value) {
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
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 66,
                    decoration: BoxDecoration(
                        color: const Color(0xFFC4C4C4).withOpacity(0.35),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/profile_image.png",
                            width: 54,
                            height: 54,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            value!.firstName,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    height: 66,
                    decoration: BoxDecoration(
                        color: const Color(0xFFC4C4C4).withOpacity(0.35),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: TextFormField(
                        //controller: nameCont,
                        onChanged: (value) {
                          //ref.read(signinProvider.notifier).checkCreds(value, passwordCont.text);
                        },
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Mail",
                          contentPadding:
                              const EdgeInsets.only(left: 30, top: 33),
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500, fontSize: 20),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    height: 66,
                    decoration: BoxDecoration(
                        color: const Color(0xFFC4C4C4).withOpacity(0.35),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: TextFormField(
                        //controller: nameCont,
                        onChanged: (value) {
                          //ref.read(signinProvider.notifier).checkCreds(value, passwordCont.text);
                        },
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Contact",
                          contentPadding:
                              const EdgeInsets.only(left: 30, top: 33),
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500, fontSize: 20),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    height: 66,
                    decoration: BoxDecoration(
                        color: const Color(0xFFC4C4C4).withOpacity(0.35),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: TextFormField(
                        //controller: nameCont,
                        onChanged: (value) {
                          //ref.read(signinProvider.notifier).checkCreds(value, passwordCont.text);
                        },
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Address",
                          contentPadding:
                              const EdgeInsets.only(left: 30, top: 33),
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500, fontSize: 20),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stacktrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  color: const Color(0xFFC4C4C4).withOpacity(0.35),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 10, top: 12),
                    child: Row(
                      children: [
                        Text(
                          "Order",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        const Spacer(),
                        Text(
                          "#399123",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          padding: EdgeInsets.zero,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Text(
                      "being packed",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Text(
                      "\$8.509 US",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 18,),
            Container(
              width: double.infinity,
              height: 66,
              decoration: BoxDecoration(
                  color: const Color(0xFFC4C4C4).withOpacity(0.35),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 45),
                child: Row(
                  children: [
                    Text(
                      "Order",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const Spacer(),
                    Text(
                      "#557123",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
