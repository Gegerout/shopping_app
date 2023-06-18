import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/auth/presentation/states/onboarding_state.dart';
import 'package:shopping_app/home/presentation/pages/home_page.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.65,
              child: PageView(
                onPageChanged: (index) {
                  ref.read(onboardingProvider.notifier).changeIndex(index);
                },
                children: [
                  onboardingCard(context, "assets/images/onb1.png", "sell and buy fruit from \ndifferent places"),
                  onboardingCard(context, "assets/images/onb2.png", "get fresh and healthy fruit \nfor you"),
                  onboardingCard(context, "assets/images/onb3.png", "organic fruit that can be \nenjoyed by everyone")
                ],
              ),
            ),
            SizedBox(height: height * 0.1,),
            DotsIndicator(
                dotsCount: 3,
              position: ref.watch(onboardingProvider),
              decorator: const DotsDecorator(
                activeColor: Color(0xFFF1C40F),
                color: Color(0xFFC4C4C4),
                size: Size(16, 16),
                activeSize: Size(16, 16)
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(page: 0,)), (route) => false);
              }, child: Text("Next", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 20, color: const Color(0xFFF1C40F)),)),
            )
          ],
        ),
      ),
    );
  }

  Widget onboardingCard(BuildContext context, String image, String subtitle) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: height * 0.1,),
        Image.asset(image),
        SizedBox(height: height * 0.03,),
        Text("Best shop fruit", style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 25),),
        SizedBox(height: height * 0.028,),
        Text(subtitle, style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15), textAlign: TextAlign.center,)
      ],
    );
  }
}
