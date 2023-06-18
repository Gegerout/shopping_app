import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/home/presentation/pages/settings_page.dart';
import 'package:shopping_app/home/presentation/states/cart_state.dart';

import 'home_page.dart';
import 'notif_page.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  int currentPage = 2;

  void initState() {
    super.initState();
    ref.refresh(getCartProvider).value;
  }

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
          "Cart",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: const Color(0xFFF1C40F)),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset("assets/images/search_big.png")
          )
        ],
      ),
      body: ref.watch(getCartProvider).when(data: (value) {
        if(value != null) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                const SizedBox(height: 20,), Row(
                    children: [
                      Image.network(value[0].image, width: 80, height: 80,),
                      const Spacer(),
                      Text("${value[0].count} Kg", style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15),),
                      const SizedBox(width: 12,),
                      Text("\$${value[0].price} US", style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15),)
                    ],
                  ),
                Container(
                  height: 81,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC0C0C0),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: () {}, icon: Image.asset("assets/images/edit_icon.png")),
                      IconButton(onPressed: () {}, icon: Image.asset("assets/images/trash_icon.png"))
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(value[0].title, style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 18),),
                    const Spacer(),
                    Text("\$${value[0].price} US", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 18),)
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Delivery", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 18),),
                    const Spacer(),
                    Text("\$7.511 US", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 18),)
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text("Total", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 22),),
                    const Spacer(),
                    Text("\$${int.parse(value[0].price) + 7.511} US", style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 22),)
                  ],
                ),
                const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          //ref.read(buyProvider.notifier).addToCart(widget.title, widget.price, widget.image);
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFF1C40F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Text(
                          "Checkout",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        )),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text("Cart is empty"),
        );
      }, error: (error, stacktrace) {
        print(error);
        return Center(
          child: Text(error.toString()),
        );
      }, loading: () => const Center(child: CircularProgressIndicator())),
      bottomNavigationBar: Scaffold.of(context).widget.bottomNavigationBar == null ? SizedBox(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(page: 0,)));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(page: 1,)));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(page: 2,)));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(page: 3,)));
                },
                child: Image.asset(currentPage == 3
                    ? "assets/images/settings_active.png"
                    : "assets/images/settings_icon.png"),
              ),
            ],
          ),
        ),
      ) : null,
      floatingActionButtonLocation: Scaffold.of(context).widget.bottomNavigationBar == null ? FloatingActionButtonLocation.centerDocked : null,
      floatingActionButton: Scaffold.of(context).widget.bottomNavigationBar == null ? Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          width: 60,
          height: 60,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: const Color(0xFFF1C40F),
              onPressed: () {},
              child: const Icon(Icons.add, size: 40,),
            ),
          ),
        ),
      ) : null
    );
  }
}
