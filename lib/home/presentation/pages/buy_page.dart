import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/home/presentation/pages/settings_page.dart';

import '../states/buy_state.dart';
import 'cart_page.dart';
import 'home_page.dart';
import 'notif_page.dart';

class BuyPage extends ConsumerStatefulWidget {
  const BuyPage(
      {Key? key, required this.title, required this.price, required this.image})
      : super(key: key);

  final String title;
  final String price;
  final String image;

  @override
  ConsumerState<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends ConsumerState<BuyPage> {
  int currentPage = 2;

  final screens = [
    HomeWidget(),
    NotifPage(),
    CartPage(),
    SettingsPage(),
  ];

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
          "Shop",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 5,
                child: SizedBox(
                    width: 258,
                    height: 258,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.network(widget.image))),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              widget.title,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: 83,
              height: 25,
              decoration: BoxDecoration(
                  color: const Color(0xFFC0C0C0).withOpacity(0.35),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (ref.watch(buyProvider).count != 1) {
                            ref.read(buyProvider.notifier).decrement();
                          }
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFFF1C40F),
                          size: 24,
                        )),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Text(
                    "${ref.watch(buyProvider).count} Kg",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: const Color(0xFFF1C40F)),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  SizedBox(
                    width: 24,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          ref.read(buyProvider.notifier).increment();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Color(0xFFF1C40F),
                          //size: 24,
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "\$${int.parse(widget.price) * ref.watch(buyProvider).count} US",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: const Color(0xFFF1C40F)),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFFF1C40F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "Add to cart",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 25),
                    )),
              ),
            ),
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
      floatingActionButton: Padding(
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
      ),
    );
  }
}
