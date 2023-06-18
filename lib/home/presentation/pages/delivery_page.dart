import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/home/presentation/pages/settings_page.dart';

import 'cart_page.dart';
import 'home_page.dart';
import 'notif_page.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  int currentPage = 2;
  int currentTap = 0;

  final screens = [
    HomeWidget(),
    NotifPage(),
    CartPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final widgets = [
      pinWidget(context),
      cardWidget(context)
    ];

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
          "Delivery address",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTap = 0;
                    });
                  },
                    child: Image.asset(currentTap == 0
                        ? "assets/images/pin_active.png"
                        : "assets/images/pin.png")),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTap = 1;
                    });
                  },
                  child: Image.asset(currentTap == 1
                      ? "assets/images/card_active.png"
                      : "assets/images/card.png"),
                )
              ],
            ),
            widgets.elementAt(currentTap)
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 88,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    currentPage = 0;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                page: 0,
                              )));
                },
                child: Image.asset(currentPage == 0
                    ? "assets/images/home_active.png"
                    : "assets/images/home_icon.png"),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    currentPage = 1;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                page: 1,
                              )));
                },
                child: Image.asset(currentPage == 1
                    ? "assets/images/bell_active.png"
                    : "assets/images/bell_icon.png"),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    currentPage = 2;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                page: 2,
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Image.asset(currentPage == 2
                      ? "assets/images/shop_active.png"
                      : "assets/images/shop_icon.png"),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    currentPage = 3;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                page: 3,
                              )));
                },
                child: Image.asset(currentPage == 3
                    ? "assets/images/settings_active.png"
                    : "assets/images/settings_icon.png"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0.0 ? Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          width: 60,
          height: 60,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: const Color(0xFFF1C40F),
              onPressed: () {},
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ),
      ) : null,
    );
  }

  Widget pinWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
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
                    hintText: "Full Name",
                    contentPadding: const EdgeInsets.only(left: 30, top: 33),
                    hintStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 20),
                    border:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
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
                    hintText: "Phone number",
                    contentPadding: const EdgeInsets.only(left: 30, top: 33),
                    hintStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 20),
                    border:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
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
                    hintText: "Street address",
                    contentPadding: const EdgeInsets.only(left: 30, top: 33),
                    hintStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 20),
                    border:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(BuildContext context) {
    return Column();
  }
}
