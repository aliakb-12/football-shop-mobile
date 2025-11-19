import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/models/footballshop_entry.dart';
import 'package:football_shop/models/footballshop_entry_card.dart';
import 'package:football_shop/screens/product_detail.dart';

class FootballShopEntryListPage extends StatefulWidget {
  const FootballShopEntryListPage({super.key});

  @override
  State<FootballShopEntryListPage> createState() => _FootballShopEntryListPageState();
}

class _FootballShopEntryListPageState extends State<FootballShopEntryListPage>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  List<FootballShopEntry> allProducts = [];
  List<FootballShopEntry> myProducts = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );

    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final request = context.read<CookieRequest>();

    // Fetch ALL products
    final allResponse =
await request.get("http://localhost:8000/products/json/");
    allProducts = List<FootballShopEntry>.from(
      allResponse.map((d) => FootballShopEntry.fromJson(d)),
    );

    // Fetch MY products
    final myResponse =
await request.get("http://localhost:8000/products/json/?filter=my");
    myProducts = List<FootballShopEntry>.from(
      myResponse.map((d) => FootballShopEntry.fromJson(d)),
    );

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FootballShop Products"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "All Products"),
            Tab(text: "My Products"),
          ],
        ),
      ),

      drawer: const LeftDrawer(),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                // ====================
                // ALL PRODUCTS TAB
                // ====================
                buildList(allProducts),

                // ====================
                // MY PRODUCTS TAB
                // ====================
                buildList(myProducts),
              ],
            ),
    );
  }

  Widget buildList(List<FootballShopEntry> items) {
    if (items.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "There are no products to show.",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: fetchProducts,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) => FootballshopEntryCard(
          footballShop: items[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailPage(product: items[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
