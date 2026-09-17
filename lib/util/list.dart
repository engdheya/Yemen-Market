List<List<dynamic>> items = [
  [
    "Basmati Rice",
    "Groceries",
    "https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=400&q=80",
    "4.50",
    "kg",
  ],
  [
    "Pure Cooking Oil",
    "Groceries",
    "https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5?auto=format&fit=crop&w=400&q=80",
    "3.20",
    "litre",
  ],
  [
    "Fresh Whole Milk",
    "Beverages",
    "https://images.unsplash.com/photo-1563636619-e9143da7973b?auto=format&fit=crop&w=400&q=80",
    "1.50",
    "litre",
  ],
  [
    "Yemeni Coffee Beans",
    "Beverages",
    "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?auto=format&fit=crop&w=400&q=80",
    "8.90",
    "kg",
  ],
  [
    "Black Tea Bags",
    "Beverages",
    "https://images.unsplash.com/photo-1576092768241-dec231879fc3?auto=format&fit=crop&w=400&q=80",
    "2.40",
    "pack",
  ],
  [
    "White Fine Sugar",
    "Groceries",
    "https://images.unsplash.com/photo-1581441363689-1f3c3c414635?auto=format&fit=crop&w=400&q=80",
    "1.80",
    "kg",
  ],
  [
    "Wheat Flour",
    "Groceries",
    "https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=400&q=80",
    "1.20",
    "kg",
  ],
  [
    "Penne Pasta",
    "Groceries",
    "https://images.unsplash.com/photo-1621996346565-e3d5d6281270?auto=format&fit=crop&w=400&q=80",
    "1.60",
    "pack",
  ],
  [
    "Organic Dates",
    "Snacks",
    "https://images.unsplash.com/photo-1594282486552-05b4d80fbb9f?auto=format&fit=crop&w=400&q=80",
    "5.50",
    "kg",
  ],
  [
    "Natural Sidr Honey",
    "Groceries",
    "https://images.unsplash.com/photo-1587049352847-4a222e784d38?auto=format&fit=crop&w=400&q=80",
    "12.00",
    "jar",
  ],
  [
    "Butter Biscuits",
    "Snacks",
    "https://images.unsplash.com/photo-1558961363-fa8fdf82db35?auto=format&fit=crop&w=400&q=80",
    "1.30",
    "pack",
  ],
  [
    "Fresh Tomatoes",
    "Vegetables",
    "https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&w=400&q=80",
    "0.90",
    "kg",
  ],
  [
    "Fresh Potatoes",
    "Vegetables",
    "https://images.unsplash.com/photo-1518977676601-b53f82aba655?auto=format&fit=crop&w=400&q=80",
    "0.75",
    "kg",
  ],
  [
    "Organic Broccoli",
    "Vegetables",
    "https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?auto=format&fit=crop&w=400&q=80",
    "1.40",
    "kg",
  ],
  [
    "Fresh Oranges",
    "Fruits",
    "https://images.unsplash.com/photo-1547514701-42782101795e?auto=format&fit=crop&w=400&q=80",
    "1.10",
    "kg",
  ],
  [
    "Sweet Bananas",
    "Fruits",
    "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?auto=format&fit=crop&w=400&q=80",
    "0.85",
    "kg",
  ],
  [
    "Red Apples",
    "Fruits",
    "https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?auto=format&fit=crop&w=400&q=80",
    "1.50",
    "kg",
  ],
  [
    "Fresh Whole Chicken",
    "Meat",
    "https://images.unsplash.com/photo-1587593810167-a84920ea0781?auto=format&fit=crop&w=400&q=80",
    "4.80",
    "kg",
  ],
  [
    "Fresh Beef Cuts",
    "Meat",
    "https://images.unsplash.com/photo-1603048588665-791ca8aea617?auto=format&fit=crop&w=400&q=80",
    "7.50",
    "kg",
  ],
  [
    "Fresh Sea Salmon",
    "Fish",
    "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?auto=format&fit=crop&w=400&q=80",
    "8.50",
    "kg",
  ],
  [
    "Fresh Shrimp",
    "Fish",
    "https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?auto=format&fit=crop&w=400&q=80",
    "9.20",
    "kg",
  ],
  [
    "Natural Fruit Juice",
    "Beverages",
    "https://images.unsplash.com/photo-1613478223719-2ab802602423?auto=format&fit=crop&w=400&q=80",
    "2.10",
    "litre",
  ]
];

List<List<dynamic>> cart = [];
List<List<dynamic>> fav = [];
List<int> tapList = [1];

List<Map<String, dynamic>> demoOrders = [
  {
    "id": "YM-84920",
    "date": "Today, 10:30 AM",
    "itemsCount": 3,
    "total": "18.60",
    "status": "In Transit",
    "address": "Taiz, Yemen",
    "items": ["Basmati Rice (2 kg)", "Pure Cooking Oil (1 L)", "Fresh Whole Milk (1 L)"]
  },
  {
    "id": "YM-73194",
    "date": "Yesterday, 4:15 PM",
    "itemsCount": 2,
    "total": "14.40",
    "status": "Delivered",
    "address": "Taiz, Yemen",
    "items": ["Yemeni Coffee Beans (1 kg)", "Natural Sidr Honey (1 jar)"]
  }
];
