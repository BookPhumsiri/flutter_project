import '../models/category.dart';
import '../models/food_item.dart';
import '../models/restaurant.dart';

class MockData {
  static const List<Category> categories = [
    Category(
      id: '1',
      name: 'Rice',
      iconUrl: 'assets/icons/burger.png',
    ), // Reusing icons for now as I can't change assets easily without upload
    Category(id: '2', name: 'Noodle', iconUrl: 'assets/icons/noodle.png'),
    Category(id: '3', name: 'Soup', iconUrl: 'assets/icons/sushi.png'),
    Category(id: '4', name: 'Drink', iconUrl: 'assets/icons/drink.png'),
    Category(id: '5', name: 'Dessert', iconUrl: 'assets/icons/dessert.png'),
    Category(id: '6', name: 'Curry', iconUrl: 'assets/icons/pizza.png'),
  ];

  static const List<Restaurant> restaurants = [
    Restaurant(
      id: 'r1',
      name: 'Krua Siam',
      imageUrl:
          'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      rating: 4.7,
    ),
    Restaurant(
      id: 'r2',
      name: 'Bangkok Street Food',
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80',
      rating: 4.5,
    ),
    Restaurant(
      id: 'r3',
      name: 'Chiang Mai Kitchen',
      imageUrl:
          'https://images.unsplash.com/photo-1562565652-f5e55e37a85e?w=500&q=80',
      rating: 4.8,
    ),
    Restaurant(
      id: 'r4',
      name: 'Spicy Basil',
      imageUrl:
          'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80',
      rating: 4.6,
    ),
    Restaurant(
      id: 'r5',
      name: 'The Pad Thai Shop',
      imageUrl:
          'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      rating: 4.4,
    ),
    Restaurant(
      id: 'r6',
      name: 'Tom Yum World',
      imageUrl:
          'https://images.unsplash.com/photo-1548943487-a2e4e43b485c?w=500&q=80',
      rating: 4.7,
    ),
    Restaurant(
      id: 'r7',
      name: 'Isan Zap',
      imageUrl:
          'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      rating: 4.3,
    ),
    Restaurant(
      id: 'r8',
      name: 'Green Curry House',
      imageUrl:
          'https://images.unsplash.com/photo-1626804475297-411dbe66129e?w=500&q=80',
      rating: 4.9,
    ),
    Restaurant(
      id: 'r9',
      name: 'Sweet Mango',
      imageUrl:
          'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
      rating: 4.5,
    ),
  ];

  static List<FoodItem> getMenu(String restaurantId) {
    return _restaurantMenus[restaurantId] ?? [];
  }

  static final Map<String, List<FoodItem>> _restaurantMenus = {
    'r1': _generateGeneralThaiMenu(),
    'r2': _generateStreetFoodMenu(),
    'r3': _generateNorthernThaiMenu(),
    'r4': _generateSpicyMenu(),
    'r5': _generateNoodleMenu(),
    'r6': _generateSoupMenu(),
    'r7': _generateIsanMenu(),
    'r8': _generateCurryMenu(),
    'r9': _generateDessertMenu(),
  };

  static List<FoodItem> get featuredItems =>
      _restaurantMenus['r1']!.take(4).toList();

  // Generators for distinct menus
  static List<FoodItem> _generateGeneralThaiMenu() {
    const images = [
      'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      'https://images.unsplash.com/photo-1562565652-f5e55e37a85e?w=500&q=80',
      'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80',
      'https://images.unsplash.com/photo-1548943487-a2e4e43b485c?w=500&q=80',
      'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
      'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475297-411dbe66129e?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475315-99d91f86c2e5?w=500&q=80',
      'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
    ];
    const names = [
      'Pad Thai',
      'Tom Yum Goong',
      'Green Curry',
      'Som Tum',
      'Massaman Curry',
      'Fried Rice',
      'Spring Rolls',
      'Mango Sticky Rice',
      'Basil Chicken',
      'Panang Curry',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r1_$index',
        name: names[index],
        description: 'Authentic ${names[index]} made with traditional recipes.',
        price: 120.0 + (index * 10),
        imageUrl: images[index],
        rating: 4.5 + (index % 5) / 10,
      ),
    );
  }

  static List<FoodItem> _generateStreetFoodMenu() {
    const images = [
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80',
      'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
      'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?w=500&q=80',
      'https://images.unsplash.com/photo-1593560706803-e12f7e80a817?w=500&q=80',
      'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=500&q=80',
      'https://images.unsplash.com/photo-1590947132387-155cc02f3212?w=500&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500&q=80',
      'https://images.unsplash.com/photo-1588315029754-2dd089d39a1a?w=500&q=80',
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500&q=80',
    ];
    const names = [
      'Moo Ping (Grilled Pork)',
      'Chicken Satay',
      'Pad Kra Pao',
      'Oyster Omelette',
      'Boat Noodles',
      'Thai Fish Cakes',
      'Grilled Squid',
      'Fried Bananas',
      'Roti',
      'Iced Tea',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r2_$index',
        name: names[index],
        description: 'Popular street food: ${names[index]}.',
        price: 50.0 + (index * 5),
        imageUrl: images[index],
        rating: 4.3 + (index % 5) / 10,
      ),
    );
  }

  static List<FoodItem> _generateNorthernThaiMenu() {
    const images = [
      'https://images.unsplash.com/photo-1562565652-f5e55e37a85e?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475297-411dbe66129e?w=500&q=80',
      'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      'https://images.unsplash.com/photo-1548943487-a2e4e43b485c?w=500&q=80',
      'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80',
      'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
      'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475315-99d91f86c2e5?w=500&q=80',
      'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
    ];
    const names = [
      'Khao Soi',
      'Sai Oua (Sausage)',
      'Nam Prik Ong',
      'Kaeng Hang Lei',
      'Khanom Jeen Nam Ngiao',
      'Miang Kham',
      'Tam Khanun',
      'Larb Kua',
      'Sticky Rice',
      'Thai Tea',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r3_$index',
        name: names[index],
        description: 'Northern Thai specialty: ${names[index]}.',
        price: 100.0 + (index * 10),
        imageUrl: images[index],
        rating: 4.6 + (index % 4) / 10,
      ),
    );
  }

  static List<FoodItem> _generateSpicyMenu() {
    const images = [
      'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80',
      'https://images.unsplash.com/photo-1548943487-a2e4e43b485c?w=500&q=80',
      'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
      'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475297-411dbe66129e?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475315-99d91f86c2e5?w=500&q=80',
      'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
      'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      'https://images.unsplash.com/photo-1562565652-f5e55e37a85e?w=500&q=80',
    ];
    const names = [
      'Spicy Basil Pork',
      'Tom Yum Soup',
      'Green Curry',
      'Red Curry',
      'Jungle Curry',
      'Spicy Catfish',
      'Drunken Noodles',
      'Spicy Beef Salad',
      'Chili Dip',
      'Hot Pot',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r4_$index',
        name: names[index],
        description: 'Very spicy ${names[index]} for heat lovers.',
        price: 110.0 + (index * 10),
        imageUrl: images[index],
        rating: 4.5 + (index % 5) / 10,
      ),
    );
  }

  static List<FoodItem> _generateNoodleMenu() {
    const images = [
      'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
      'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475297-411dbe66129e?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475315-99d91f86c2e5?w=500&q=80',
      'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
      'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      'https://images.unsplash.com/photo-1562565652-f5e55e37a85e?w=500&q=80',
      'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80',
    ];
    const names = [
      'Pad Thai',
      'Pad See Ew',
      'Rad Na',
      'Boat Noodles',
      'Yen Ta Fo',
      'Khao Soi',
      'Glass Noodle Salad',
      'Suki Yaki',
      'Tom Yum Noodle',
      'Chicken Noodle',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r5_$index',
        name: names[index],
        description: 'Delicious ${names[index]} noodles.',
        price: 80.0 + (index * 5),
        imageUrl: images[index],
        rating: 4.4 + (index % 5) / 10,
      ),
    );
  }

  static List<FoodItem> _generateSoupMenu() {
    const images = [
      'https://images.unsplash.com/photo-1548943487-a2e4e43b485c?w=500&q=80',
      'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80',
      'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
      'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475297-411dbe66129e?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475315-99d91f86c2e5?w=500&q=80',
      'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
      'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      'https://images.unsplash.com/photo-1562565652-f5e55e37a85e?w=500&q=80',
    ];
    const names = [
      'Tom Yum Goong',
      'Tom Kha Gai',
      'Clear Soup',
      'Wonton Soup',
      'Spicy Pork Soup',
      'Tofu Soup',
      'Mushroom Soup',
      'Seafood Soup',
      'Vegetable Soup',
      'Rice Soup',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r6_$index',
        name: names[index],
        description: 'Hot and comforting ${names[index]}.',
        price: 130.0 + (index * 10),
        imageUrl: images[index],
        rating: 4.6 + (index % 3) / 10,
      ),
    );
  }

  static List<FoodItem> _generateIsanMenu() {
    const images = [
      'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
      'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475297-411dbe66129e?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475315-99d91f86c2e5?w=500&q=80',
      'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
      'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      'https://images.unsplash.com/photo-1562565652-f5e55e37a85e?w=500&q=80',
      'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80',
      'https://images.unsplash.com/photo-1548943487-a2e4e43b485c?w=500&q=80',
    ];
    const names = [
      'Som Tum (Papaya Salad)',
      'Larb Moo',
      'Nam Tok Neua',
      'Grilled Chicken',
      'Sticky Rice',
      'Spicy Bamboo Salad',
      'Isan Sausage',
      'Tom Saep',
      'Grilled Fish',
      'Spicy Dipping Sauce',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r7_$index',
        name: names[index],
        description: 'Zesty Isan style ${names[index]}.',
        price: 90.0 + (index * 8),
        imageUrl: images[index],
        rating: 4.5 + (index % 5) / 10,
      ),
    );
  }

  static List<FoodItem> _generateCurryMenu() {
    const images = [
      'https://images.unsplash.com/photo-1626804475297-411dbe66129e?w=500&q=80',
      'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?w=500&q=80',
      'https://images.unsplash.com/photo-1548943487-a2e4e43b485c?w=500&q=80',
      'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=500&q=80',
      'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=500&q=80',
      'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&q=80',
      'https://images.unsplash.com/photo-1626804475315-99d91f86c2e5?w=500&q=80',
      'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
      'https://images.unsplash.com/photo-1559314809-0d155014e29e?w=500&q=80',
      'https://images.unsplash.com/photo-1562565652-f5e55e37a85e?w=500&q=80',
    ];
    const names = [
      'Green Curry',
      'Red Curry',
      'Yellow Curry',
      'Massaman Curry',
      'Panang Curry',
      'Jungle Curry',
      'Roast Duck Curry',
      'Fish Curry',
      'Crab Curry',
      'Vegetable Curry',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r8_$index',
        name: names[index],
        description: 'Rich and creamy ${names[index]}.',
        price: 150.0 + (index * 12),
        imageUrl: images[index],
        rating: 4.8 + (index % 2) / 10,
      ),
    );
  }

  static List<FoodItem> _generateDessertMenu() {
    const images = [
      'https://images.unsplash.com/photo-1596626779476-1bd195804342?w=500&q=80',
      'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?w=500&q=80',
      'https://images.unsplash.com/photo-1587314168485-3236d6710814?w=500&q=80',
      'https://images.unsplash.com/photo-1551024709-8f23befc6f87?w=500&q=80',
      'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=500&q=80',
      'https://images.unsplash.com/photo-1551504734-b40b0805bd80?w=500&q=80',
      'https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=500&q=80',
      'https://images.unsplash.com/photo-1616031036668-3ff255b0a337?w=500&q=80',
      'https://images.unsplash.com/photo-1551024506-0bccd828d307?w=500&q=80',
      'https://images.unsplash.com/photo-1505253716362-afaea1d3d1af?w=500&q=80',
    ];
    const names = [
      'Mango Sticky Rice',
      'Coconut Ice Cream',
      'Thai Tea Cake',
      'Bua Loy',
      'Khanom Krok',
      'Tub Tim Krob',
      'Lod Chong',
      'Sang Kaya Fug Tong',
      'Roti Sweet',
      'Fruit Platter',
    ];
    return List.generate(
      10,
      (index) => FoodItem(
        id: 'r9_$index',
        name: names[index],
        description: 'Sweet Thai dessert: ${names[index]}.',
        price: 80.0 + (index * 5),
        imageUrl: images[index],
        rating: 4.7 + (index % 3) / 10,
      ),
    );
  }
}
