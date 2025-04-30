import 'package:flutter/material.dart';
import 'package:foodapp/widgets/catergory_cell.dart';
import 'package:foodapp/widgets/color_extension.dart';
import 'package:foodapp/widgets/most_popular_cell.dart';
import 'package:foodapp/widgets/pop_row.dart';
import 'package:foodapp/widgets/recent_items.dart';
import 'package:foodapp/widgets/view_all_title_rows.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController txtsearch = TextEditingController();

  List catArr = [
    {"image": "assets/images/food1.jpg", "name": "Offers"},
    {"image": "assets/images/food5.jpg", "name": "Sri Lankan"},
    {"image": "assets/images/food3.jpg", "name": "Italian"},
    {"image": "assets/images/food4.jpg", "name": "Indian"},
  ];

  List popArr = [
    {
      "image": "assets/images/food7.jpg",
      "name": "Minutes by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/food8.jpg",
      "name": "Cafe de Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/food3.jpg",
      "name": "Bakes by Tella",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/food4.jpg",
      "name": "Indian",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/images/food7.jpg",
      "name": "Minutes by tuk tuk",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/food8.jpg",
      "name": "Cafe de Noir",
      "rate": "4.7",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
  ];

  List recentArr = [
    {
      "image": "assets/images/pizza.jpg",
      "name": "Mulberry Pizza by John",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/food6.jpg",
      "name": "Barita",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/images/food3.jpg",
      "name": "Pizza Rush Hour",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Good Day Mayowa,",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart, size: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivering to",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Tcolor.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        "Current Location",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Tcolor.secondaryText,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on),
                        color: Tcolor.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: txtsearch,
                decoration: InputDecoration(
                  hintText: "Search Food",
                  filled: true,
                  fillColor: Tcolor.textbox,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BODY SCROLLABLE
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 148,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: catArr.length,
                        itemBuilder: (context, index) {
                          var cObj = catArr[index] as Map? ?? {};
                          return CatergoryCell(cObj: cObj, onTap: () {});
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ViewAllTitleRows(
                        title: "Popular Restaurants",
                        onView: () {},
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: popArr.length,
                      itemBuilder: (context, index) {
                        var pObj = popArr[index] as Map? ?? {};
                        return PopRow(pObj: pObj, onTap: () {});
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ViewAllTitleRows(
                        title: "Most Popular",
                        onView: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: mostPopArr.length,
                        itemBuilder: (context, index) {
                          var mObj = mostPopArr[index] as Map? ?? {};
                          return MostPopularCell(cObj: mObj, onTap: () {});
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ViewAllTitleRows(
                        title: "Recent Items",
                        onView: () {},
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      itemCount: recentArr.length,
                      itemBuilder: (context, index) {
                        var rObj = recentArr[index] as Map? ?? {};
                        return RecentItems(rObj: rObj, onTap: () {});
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
