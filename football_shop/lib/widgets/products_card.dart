import 'package:flutter/material.dart';
import 'package:football_shop/screens/productlist_form.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/footballshop_entry_list.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          if (item.name == "Create Product") {
            // Navigate to Create Product Form
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFormPage(),
              ),
            );
          } else if (item.name == "All Products") {
            // Navigate to FootballShop list page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FootballShopEntryListPage(),
              ),
          );
                     } else if (item.name == "My Product") {
            // Navigate to FootballShop list page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FootballShopEntryListPage(),
              ),
            ); 
          } else {
            // Default action → show snackbar
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")),
              );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const SizedBox(height: 3),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
