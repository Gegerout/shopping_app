import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(child: Image.asset("assets/images/success_image.png")),
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Center(
                  child: Text(
                "Order Place \nYour Order Number is \n#399123",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, fontSize: 23),
                textAlign: TextAlign.center,
              )),
            )
          ],
        ),
      ),
    );
  }
}
