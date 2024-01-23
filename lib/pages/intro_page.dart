import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/themes/colors.dart';
import 'package:sushishop/widgets/buttons.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Gap(20),
            Text(
              "SUSHI MAN",
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset('assets/images/salmon_eggs.png'),
            ),
            const Gap(7),
            Text(
              'THE TASTE OF JAPANESES FOOD',
              style:
                  GoogleFonts.dmSerifDisplay(fontSize: 25, color: Colors.white),
            ),
            const Gap(7),
            Text(
                'Feel the taste of the most popular Japanese food anywhere and anytime',
                style: TextStyle(color: Colors.grey[300], height: 2)),
            const Gap(20),
            MyButton(
              text: 'Get Started',
              onTap: () => {Navigator.pushNamed(context, '/menuPage')},
            )
          ],
        ),
      ),
    );
  }
}
