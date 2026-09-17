import 'package:flutter/material.dart';
import '../details.dart';
import 'list.dart';

class Box extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final String unit;
  final String cat;
  final int index;
  final VoidCallback? onFavoriteToggle;

  const Box({
    Key? key,
    required this.name,
    required this.price,
    required this.unit,
    required this.image,
    required this.cat,
    required this.index,
    this.onFavoriteToggle,
  }) : super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  @override
  void didUpdateWidget(covariant Box oldWidget) {
    super.didUpdateWidget(oldWidget);
    _checkFavoriteStatus();
  }

  void _checkFavoriteStatus() {
    final favItem = fav.firstWhere(
      (item) => item[0] == widget.name,
      orElse: () => [],
    );
    isFavorite = favItem.isNotEmpty;
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

  void _onAddTap(String name, int realIndex) {
    setState(() {
      int cartIndex = cart.indexWhere((item) => item[0] == name);

      // Find real item array reference from items list or create standard array
      List<dynamic> targetItem;
      if (realIndex >= 0 && realIndex < items.length) {
        targetItem = items[realIndex];
      } else {
        targetItem = [widget.name, widget.cat, widget.image, widget.price, widget.unit];
      }

      if (cartIndex == -1) {
        cart.add([...targetItem, 1]);
        showBottomPopup(context, '$name added to cart');
      } else {
        cart[cartIndex][5] += 1;
        showBottomPopup(context, '$name quantity updated');
      }
    });
  }

  void _toggleFavorite() {
    setState(() {
      final existingIndex = fav.indexWhere((item) => item[0] == widget.name);

      if (isFavorite) {
        if (existingIndex != -1) fav.removeAt(existingIndex);
        isFavorite = false;
        showBottomPopup(context, '${widget.name} removed from favorites');
      } else {
        if (existingIndex == -1) {
          List<dynamic> targetItem;
          if (widget.index >= 0 && widget.index < items.length) {
            targetItem = items[widget.index];
          } else {
            targetItem = [widget.name, widget.cat, widget.image, widget.price, widget.unit];
          }
          fav.add([...targetItem, 1]);
        }
        isFavorite = true;
        showBottomPopup(context, '${widget.name} added to favorites');
      }

      widget.onFavoriteToggle?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Container
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            name: widget.name,
                            cat: widget.cat,
                            price: widget.price,
                            image: widget.image,
                            keyy: widget.index >= 0 ? widget.index : 0,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xFFF5F7F6),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFE8F5E9),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_basket_outlined,
                                size: 40,
                                color: Color(0xFF2E7D32),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Content Section
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category Tag
                      Text(
                        widget.cat.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E7D32),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Product Name
                      Text(
                        widget.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF212121),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Price & Add Button Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${widget.price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF1B5E20),
                                ),
                              ),
                              Text(
                                "per ${widget.unit}",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          Material(
                            color: const Color(0xFF1B5E20),
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () => _onAddTap(widget.name, widget.index),
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Favorite Icon Button overlay
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: _toggleFavorite,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey.shade600,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
