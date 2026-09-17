import 'package:flutter/material.dart';
import 'util/list.dart';
import 'util/box_cont.dart';

class Details extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final String cat;
  final int keyy;

  const Details({
    Key? key,
    required this.name,
    required this.price,
    required this.cat,
    required this.image,
    required this.keyy,
  }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int rate = 5;
  int qty = 1;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = fav.any((item) => item[0] == widget.name);
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite) {
        fav.removeWhere((item) => item[0] == widget.name);
        showBottomPopup(context, '${widget.name} removed from favorites');
      } else {
        List<dynamic> targetItem;
        if (widget.keyy >= 0 && widget.keyy < items.length) {
          targetItem = items[widget.keyy];
        } else {
          targetItem = [widget.name, widget.cat, widget.image, widget.price, "kg"];
        }
        fav.add([...targetItem, 1]);
        showBottomPopup(context, '${widget.name} added to favorites');
      }
      isFavorite = !isFavorite;
    });
  }

  void showBottomPopup(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16.0),
        backgroundColor: const Color(0xFF1B5E20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final similarItems = items.where((item) => item[1] == widget.cat && item[0] != widget.name).toList();
    final double priceDouble = double.tryParse(widget.price) ?? 0.0;
    final double totalPrice = priceDouble * qty;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF212121)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(color: Color(0xFF212121), fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey.shade700,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Product Image View
            Container(
              height: 260,
              width: double.infinity,
              color: Colors.white,
              child: Image.network(
                widget.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFE8F5E9),
                  child: const Icon(Icons.shopping_basket, size: 80, color: Color(0xFF1B5E20)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Badge & Name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8F5E9),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                widget.cat.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1B5E20),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color(0xFF212121),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Quantity Counter Component
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 16),
                              onPressed: () {
                                if (qty > 1) {
                                  setState(() => qty--);
                                }
                              },
                            ),
                            Text(
                              qty.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 16, color: Color(0xFF1B5E20)),
                              onPressed: () => setState(() => qty++),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Rating Row
                  Row(
                    children: [
                      for (int i = 0; i < rate; i++)
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 8),
                      const Text(
                        "5.0 (Fresh Quality Guaranteed)",
                        style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Description Title & Body
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF212121)),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Premium quality ${widget.name.toLowerCase()} sourced fresh for Yemen Market customers in Taiz. Carefully inspected for hygiene, safety, and fresh taste.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Similar Products Slider
                  if (similarItems.isNotEmpty) ...[
                    const Text(
                      "Similar Products",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF212121)),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: similarItems.length,
                        itemBuilder: (context, index) {
                          final item = similarItems[index];
                          final realIndex = items.indexWhere((orig) => orig[0] == item[0]);

                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              width: 150,
                              child: Box(
                                name: item[0],
                                cat: item[1],
                                image: item[2],
                                price: item[3],
                                unit: item[4],
                                index: realIndex >= 0 ? realIndex : index,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B5E20),
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B5E20),
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.shopping_basket_outlined, color: Colors.white),
              label: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onPressed: () {
                setState(() {
                  int cartIndex = cart.indexWhere((item) => item[0] == widget.name);
                  List<dynamic> targetItem;
                  if (widget.keyy >= 0 && widget.keyy < items.length) {
                    targetItem = items[widget.keyy];
                  } else {
                    targetItem = [widget.name, widget.cat, widget.image, widget.price, "kg"];
                  }

                  if (cartIndex == -1) {
                    cart.add([...targetItem, qty]);
                  } else {
                    cart[cartIndex][5] += qty;
                  }
                  showBottomPopup(context, '${widget.name} added to cart');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
