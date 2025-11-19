import 'package:flutter/material.dart';
import 'package:football_shop/models/footballshop_entry.dart';
import 'package:intl/intl.dart';

class FootballshopEntryCard extends StatelessWidget {
  final FootballShopEntry footballShop;
  final VoidCallback onTap;

  const FootballshopEntryCard({
    super.key,
    required this.footballShop,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final f = footballShop.fields;
    final createdDate = DateFormat('dd MMM yyyy, HH:mm').format(f.createdAt);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(f.thumbnail)}',
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 170,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.broken_image, size: 40),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Product Name
                Text(
                  f.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Price
                Text(
                  'Rp ${f.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                // Description preview
                Text(
                  f.description.length > 120
                      ? '${f.description.substring(0, 120)}...'
                      : f.description,
                  style: const TextStyle(color: Colors.black87),
                ),

                const SizedBox(height: 10),

                // Category + Featured
                Row(
                  children: [
                    // Category label
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        f.category
                            .toString()
                            .split('.')
                            .last
                            .replaceAll('_', ' '),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Featured badge
                    if (f.isFeatured)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Featured ⭐',
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 12),

                // Sold & Created At
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shopping_bag_outlined, size: 18),
                        const SizedBox(width: 4),
                        Text('Sold: ${f.productSold}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, size: 18),
                        const SizedBox(width: 4),
                        Text(createdDate),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // User uploader (if exists)
                if (f.user != null)
                  Text(
                    'Uploader ID: ${f.user}',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
