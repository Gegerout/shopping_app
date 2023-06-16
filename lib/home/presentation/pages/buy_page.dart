import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({Key? key, required this.title, required this.price, required this.image}) : super(key: key);

  final String title;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.arrow_circle_left_outlined, color: Color(0xFFF1C40F), size: 36,),
        ),
        title: Text("Shop", style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 22, color: const Color(0xFFF1C40F)),),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search, color: Color(0xFFF1C40F), size: 36,),
          )
        ],
      ),
      body: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: SizedBox(
              width: 258,
                height: 258,
                child: Align(alignment: Alignment.topCenter, child: Image.network(image))
            ),
          )
        ],
      ),
    );
  }
}
