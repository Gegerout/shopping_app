import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/home/presentation/pages/do_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final TextEditingController searchCont = TextEditingController();

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
          padding: const EdgeInsets.only(top: 16, left: 30, right: 30),
          child: Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 5,
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: Center(
                child: TextFormField(
                  controller: searchCont,
                  onEditingComplete: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DoPage(prompt: searchCont.text,)));
                  },
                  autofocus: true,
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
      ),
    );
  }
}
