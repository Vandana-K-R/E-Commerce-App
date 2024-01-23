import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/pages/food_details_page.dart';
import 'package:sushishop/themes/colors.dart';
import 'package:sushishop/widgets/buttons.dart';
import 'package:sushishop/widgets/food_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetails(food: foodMenu[index])));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Center(
          child: Text(
            'TOKYO',
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartPage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get 32% promo',
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20, color: Colors.white),
                  ),
                  const Gap(20),
                  MyButton(text: 'Reedeem', onTap: () {})
                ],
              ),
              Image.asset(
                'assets/images/many_sushi.png',
                height: 100,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                hintText: 'Search Here...'),
          ),
        ),
        const Gap(5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Food menu',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18),
          ),
        ),
        const Gap(5),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                      food: foodMenu[index],
                      onTap: () {
                        navigateToFoodDetails(index);
                      },
                    ))),
        const Gap(5),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/many_sushi.png', height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Salmon Eggs',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 20)),
                      const Gap(3),
                      Text(
                        '\$21.00',
                        style:
                            GoogleFonts.dmSerifDisplay(color: Colors.grey[700]),
                      )
                    ],
                  ),
                ],
              ),
              const Gap(140),
              const Icon(
                Icons.favorite_outline,
                color: Colors.grey,
                size: 20,
              )
            ],
          ),
        )
      ]),
    );
  }
}
