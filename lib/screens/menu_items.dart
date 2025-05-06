import 'package:flutter/material.dart';
import 'package:foodapp/widgets/color_extension.dart';
import 'package:foodapp/widgets/items_details.dart';
import 'package:foodapp/widgets/menu_item_rows.dart';
import 'package:foodapp/widgets/pop_row.dart';

class MenuItems extends StatefulWidget {
  final Map? mobj;
  const MenuItems({super.key, this.mobj});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  TextEditingController txtsearch = TextEditingController();

  List<Map<String, String>> popArr = [
    {
      "image": "assets/images/desert2.jpg",
      "name": "Cake",
      "rate": "4.7",
      "rating": "210",
      "type": "Snackbar",
      "food_type": "Sweet Treat",
    },
    {
      "image": "assets/images/desert.jpg",
      "name": "Sugar Wraps",
      "rate": "4.6",
      "rating": "189",
      "type": "Snackbar",
      "food_type": "Pastries",
    },
    {
      "image": "assets/images/food3.jpg",
      "name": "Sugar Craft",
      "rate": "4.8",
      "rating": "234",
      "type": "Bakery",
      "food_type": "Desserts",
    },
    {
      "image": "assets/images/food4.jpg",
      "name": "El Mexicano",
      "rate": "4.5",
      "rating": "198",
      "type": "Restaurant",
      "food_type": "Mexican",
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // Filter the array based on the search input
    List<Map<String, String>> filteredList =
        popArr
            .where(
              (item) => item['name']!.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
            )
            .toList();

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
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Handle back
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.mobj?["name"]?.toString() ?? "Menu",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart, size: 28),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: txtsearch,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
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

            // CONTENT LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  var mObj = filteredList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MenuItemRows(
                      mObj: mObj,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (e) => ItemsDetails()),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
