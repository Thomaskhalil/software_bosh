// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:software_project/components/product_tile.dart';
import 'package:software_project/models/cart_model.dart';
import 'package:software_project/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //floating action button
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartPage();
              },
            ),
          ),
          elevation: 20.0,
          focusElevation: 20.2,
          child: Icon(
            Icons.shopping_cart_rounded,
            color: Colors.black,
          ),
          backgroundColor: Color.fromARGB(255, 242, 202, 171),
        ),
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              //menu and person icons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu_rounded),
                    Icon(Icons.person),
                  ],
                ),
              ),

              //welcome text
              Text(
                "Good Morning",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Your favorite bakery, just a tap away!",
                style: GoogleFonts.notoSerif(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 25,
              ),

              //divider
              Divider(
                thickness: 2,
                color: Colors.grey[400],
              ),

              //Fresh baked goods
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Fresh baked goods",
                  style: GoogleFonts.notoSerif(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              //grid view + provider function
              Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      itemCount: value.shopItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return ProductTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          onTap: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addItemToCart(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
