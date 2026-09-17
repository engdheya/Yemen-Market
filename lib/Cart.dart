import 'package:flutter/material.dart';
import 'util/list.dart';
import 'util/qtybox.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double getTotalPrice() {
    double total = 0.0;
    for (var item in cart) {
      double price = double.tryParse(item[3].toString()) ?? 0.0;
      int qty = item[5] is int ? item[5] : 1;
      total += price * qty;
    }
    return total;
  }

  void _showCheckoutDialog(double total) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Column(
            children: [
              Icon(Icons.check_circle, color: Color(0xFF1B5E20), size: 54),
              SizedBox(height: 12),
              Text(
                "Demo Order Confirmed!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Thank you for placing your order with Yemen Market.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Amount:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Estimated Delivery: Tomorrow in Taiz, Yemen",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B5E20),
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                setState(() {
                  // Push placed demo order into list
                  demoOrders.insert(0, {
                    "id": "YM-${10000 + tapList.length * 137}",
                    "date": "Just Now",
                    "itemsCount": cart.length,
                    "total": total.toStringAsFixed(2),
                    "status": "Processing",
                    "address": "Taiz, Yemen",
                    "items": cart.map((i) => "${i[0]} (${i[5]} ${i[4]})").toList(),
                  });
                  tapList.add(tapList.length + 1);
                  cart.clear();
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                "Continue Shopping",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = getTotalPrice();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "My Shopping Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1B5E20),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: cart.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Your cart is empty",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF212121),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Explore Yemen Market items to add to cart",
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        double price = double.tryParse(cart[index][3].toString()) ?? 0.0;
                        int qty = cart[index][5] is int ? cart[index][5] : 1;
                        double netPrice = price * qty;

                        return QuantityBox(
                          name: cart[index][0],
                          price: netPrice.toStringAsFixed(2),
                          image: cart[index][2],
                          unit: cart[index][4],
                          qty: qty,
                          onIncrement: () {
                            setState(() {
                              cart[index][5]++;
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              cart[index][5]--;
                              if (cart[index][5] <= 0) {
                                cart.removeAt(index);
                              }
                            });
                          },
                        );
                      },
                    ),
            ),

            // Cart Summary Footer
            if (cart.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subtotal",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Delivery (Taiz Region)",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          "FREE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B5E20),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF212121),
                          ),
                        ),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color(0xFF1B5E20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B5E20),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.payment, color: Colors.white),
                      label: const Text(
                        "Proceed to Demo Checkout",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () => _showCheckoutDialog(total),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
