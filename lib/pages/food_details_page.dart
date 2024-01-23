import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/models/food_model.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/themes/colors.dart';
import 'package:sushishop/widgets/buttons.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantityCount = 0;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: primaryColor,
                content: const Text(
                  "Successfully added to cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  IconButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.done))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Image.asset(widget.food.imagePath, height: 200),
                const Gap(5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow),
                    const Gap(3),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Gap(5),
                Text(widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 27)),
                const Gap(5),
                Text(
                  'Salmon sushi is a delectable and visually appealing Japanese culinary delight that showcases the exquisite flavors of fresh, high-quality salmon. This sushi variation typically features thinly sliced, vibrant orange or pink salmon atop a small bed of seasoned rice, held together by a band of seaweed, known as nori.The salmon is often meticulously sourced to ensure optimal freshness and flavor.',
                  style: TextStyle(
                      color: Colors.grey[600], fontSize: 14, height: 2),
                )
              ],
            ),
          )),
          Container(
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$' + widget.food.price,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: decrementQuantity),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(quantityCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, shape: BoxShape.circle),
                            child: IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: incrementQuantity),
                          )
                        ],
                      )
                    ],
                  ),
                  const Gap(4),
                  MyButton(text: 'Add To Cart', onTap: addToCart)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
