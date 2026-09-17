import 'package:flutter/material.dart';
import 'package:yemen_market/home_page.dart';
import 'package:yemen_market/Cart.dart';
import 'package:yemen_market/Fav.dart';
import 'package:yemen_market/Order.dart';
import 'package:yemen_market/Prof.dart';
import 'package:yemen_market/util/list.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Calculate total cart items count for badge
    final int cartItemCount = cart.fold<int>(
      0,
      (sum, item) => sum + (item.length > 5 && item[5] is int ? item[5] as int : 1),
    );

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomePage(),
          Cart(key: ValueKey('cart_${cart.length}_$cartItemCount')),
          Fav(key: ValueKey('fav_${fav.length}')),
          Order(key: ValueKey('order_${demoOrders.length}')),
          const Profile(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF1B5E20),
            unselectedItemColor: Colors.grey.shade500,
            selectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.storefront_outlined),
                activeIcon: Icon(Icons.storefront),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: cart.isNotEmpty
                    ? Badge(
                        label: Text(
                          cartItemCount.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        backgroundColor: const Color(0xFF1B5E20),
                        child: const Icon(Icons.shopping_cart_outlined),
                      )
                    : const Icon(Icons.shopping_cart_outlined),
                activeIcon: cart.isNotEmpty
                    ? Badge(
                        label: Text(
                          cartItemCount.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        backgroundColor: const Color(0xFF1B5E20),
                        child: const Icon(Icons.shopping_cart),
                      )
                    : const Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: fav.isNotEmpty
                    ? Badge(
                        label: Text(
                          fav.length.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.favorite_outline),
                      )
                    : const Icon(Icons.favorite_outline),
                activeIcon: fav.isNotEmpty
                    ? Badge(
                        label: Text(
                          fav.length.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.favorite),
                      )
                    : const Icon(Icons.favorite),
                label: 'Favorites',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined),
                activeIcon: Icon(Icons.receipt_long),
                label: 'Orders',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
