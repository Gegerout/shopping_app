import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/home/presentation/pages/home_page.dart';
import 'package:shopping_app/home/presentation/states/buy_state.dart';

class SuccessPage extends ConsumerStatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends ConsumerState<SuccessPage> {
  late Timer _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          ref.read(buyProvider.notifier).clearCart();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(page: 0)));
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
