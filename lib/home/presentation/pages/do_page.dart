import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/home/presentation/states/home_state.dart';

import 'home_page.dart';

class DoPage extends ConsumerStatefulWidget {
  const DoPage({Key? key, required this.prompt}) : super(key: key);

  final String prompt;

  @override
  ConsumerState<DoPage> createState() => _DoPageState();
}

class _DoPageState extends ConsumerState<DoPage> {
  int currentPage = 0;

  final screens = [
    HomeWidget(),
    HomeWidget(),
    HomeWidget(),
    HomeWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset("assets/images/apple_image.png"),
        ),
        title: Text(
          "BestFruitShop",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: const Color(0xFF34495E)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset("assets/images/profile_image.png"),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 5,
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Center(
                    child: TextFormField(
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400, fontSize: 18),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 62),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(right: 19),
                            child: Icon(
                              Icons.search,
                              color: Color(0xFFF1C40F),
                              size: 28,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search",
                          hintStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: const Color(0xFFC0C0C0))),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 31,
            ),
            Row(
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: const Color(0xFF34495E)),
                ),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
            ref.watch(searchProvider(widget.prompt)).when(data: (value) {
              return SizedBox(
                width: 400,
                height: 800,
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 22,
                    crossAxisCount: 2,
                    children: List.generate(value.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Center(
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: 167,
                              height: 167,
                              child: Column(
                                children: [
                                  Image.network(
                                    value[index].images[1],
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    value[index].title,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "\$${value[index].price} US",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
              );
            }, error: (error, stacktrace) => Center(child: Text(error.toString()),), loading: () => Center(child: CircularProgressIndicator(),))
          ]
          ),
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
              child: const Icon(Icons.add, size: 40,),
            ),
          ),
        ),
      ),
    );
  }
}
