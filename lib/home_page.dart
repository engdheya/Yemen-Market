import 'package:flutter/material.dart';
import 'util/box_cont.dart';
import 'util/list.dart';
import 'util/pagev.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = "All";
  String _searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _categories = [
    {"label": "All", "value": "All", "icon": Icons.grid_view_rounded},
    {"label": "Vegetables", "value": "Vegetables", "icon": Icons.eco_outlined},
    {"label": "Fruits", "value": "Fruits", "icon": Icons.apple_outlined},
    {"label": "Meat", "value": "Meat", "icon": Icons.kebab_dining_outlined},
    {"label": "Fish", "value": "Fish", "icon": Icons.set_meal_outlined},
    {"label": "Groceries", "value": "Groceries", "icon": Icons.shopping_basket_outlined},
    {"label": "Beverages", "value": "Beverages", "icon": Icons.local_drink_outlined},
    {"label": "Snacks", "value": "Snacks", "icon": Icons.cookie_outlined},
  ];

  List<List<dynamic>> get _filteredItems {
    return items.where((item) {
      final String name = item[0].toString().toLowerCase();
      final String cat = item[1].toString();
      final bool matchesCategory =
          (_selectedCategory == "All" || _selectedCategory == "null" || cat.toLowerCase() == _selectedCategory.toLowerCase());
      final bool matchesSearch =
          _searchQuery.isEmpty || name.contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void _showNotificationsSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          height: 320,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Icon(Icons.notifications_active_outlined, color: Color(0xFF1B5E20)),
                  SizedBox(width: 10),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.local_shipping_outlined, color: Color(0xFF1B5E20)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to Yemen Market!",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Same-day delivery available across Taiz.",
                            style: TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Responsive grid column calculation
    final int crossAxisCount = screenWidth > 900 ? 4 : (screenWidth > 600 ? 3 : 2);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Location Bar & App Title Header
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Yemen Market",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF1B5E20),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: const [
                            Icon(
                              Icons.location_on,
                              size: 14,
                              color: Color(0xFF2E7D32),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "Taiz, Yemen",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Notification Icon Button
                    GestureDetector(
                      onTap: _showNotificationsSheet,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFE8F5E9),
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: Color(0xFF1B5E20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Search Bar Component
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Color(0xFF1B5E20)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search fresh groceries, fruits, meat...',
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      if (_searchQuery.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = "";
                            });
                          },
                          child: const Icon(Icons.close, color: Colors.grey, size: 20),
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Promotional Banner Carousel
              SizedBox(
                height: 180,
                child: PageView(
                  children: const [
                    Pagev(
                      title: "Fresh Yemeni Produce",
                      subtitle: "Directly delivered to your doorstep in Taiz",
                      badgeText: "BEST PRICES",
                      imageUrl: "https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=600&q=80",
                    ),
                    Pagev(
                      title: "Authentic Sidr Honey & Spices",
                      subtitle: "100% Pure & Natural Guarantee",
                      badgeText: "SPECIAL DEAL",
                      imageUrl: "https://images.unsplash.com/photo-1587049352847-4a222e784d38?auto=format&fit=crop&w=600&q=80",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Categories Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Categories",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF212121),
                      ),
                    ),
                    if (_selectedCategory != "All")
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = "All";
                          });
                        },
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFF1B5E20),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Category Selector List
              SizedBox(
                height: 42,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    final bool isSelected = _selectedCategory == cat["value"];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        showCheckmark: false,
                        avatar: Icon(
                          cat["icon"] as IconData,
                          size: 16,
                          color: isSelected ? Colors.white : const Color(0xFF1B5E20),
                        ),
                        label: Text(cat["label"] as String),
                        selected: isSelected,
                        selectedColor: const Color(0xFF1B5E20),
                        backgroundColor: Colors.white,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : const Color(0xFF212121),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: isSelected ? const Color(0xFF1B5E20) : Colors.grey.shade300,
                          ),
                        ),
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = cat["value"] as String;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Products Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedCategory == "All" ? "Popular Products" : _selectedCategory,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF212121),
                      ),
                    ),
                    Text(
                      "${_filteredItems.length} items",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Product Grid View
              _filteredItems.isEmpty
                  ? Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off, size: 48, color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                          Text(
                            "No products found",
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _filteredItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.72,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final item = _filteredItems[index];
                          final int realIndex = items.indexWhere(
                            (orig) => orig[0] == item[0],
                          );

                          return Box(
                            name: item[0],
                            cat: item[1],
                            image: item[2],
                            price: item[3],
                            unit: item[4],
                            index: realIndex >= 0 ? realIndex : index,
                          );
                        },
                      ),
                    ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
