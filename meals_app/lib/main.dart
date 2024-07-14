import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"title": "Italian", "color": Colors.red},
    {"title": "German", "color": Colors.green},
    {"title": "Asian", "color": Colors.purple},
    {"title": "Mexican", "color": Colors.orange},
    {"title": "Indian", "color": Colors.yellow},
    {"title": "French", "color": Colors.blue},
    {"title": "Greek", "color": Colors.cyan},
    {"title": "Spanish", "color": Colors.pink},
    {"title": "American", "color": Colors.brown},
    {"title": "Thai", "color": Colors.teal},
    {"title": "Japanese", "color": Colors.amber},
    {"title": "Mediterranean", "color": Colors.indigo},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Category"),
      ),
      body: _selectedIndex == 0
          ? _buildCategoryGrid()
          : const Center(
              child: Text("Favorite Recipes",
                  style: TextStyle(color: Colors.white, fontSize: 24))),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeListPage(
                  category: categories[index]['title'],
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: const EdgeInsets.all(10),
              color: categories[index]['color'],
              child: Center(
                child: Text(
                  categories[index]['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RecipeListPage extends StatelessWidget {
  final String category;
  RecipeListPage({super.key, required this.category});

  final Map<String, List<Map<String, dynamic>>> recipes = {
    "Italian": [
      {
        "id": 1,
        "title": "Spaghetti Carbonara",
        "image":
            "https://images.pexels.com/photos/1527603/pexels-photo-1527603.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "30 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Boil water in a large pot, add salt, and cook spaghetti until al dente.",
          "In a separate pan, fry diced pancetta until crispy. Set aside on paper towels to drain excess fat.",
          "In a bowl, mix eggs, grated cheese, and black pepper.",
          "Combine cooked spaghetti with pancetta in the pan, then add the egg mixture. Mix thoroughly over low heat until creamy.",
          "Serve hot, garnished with extra grated cheese and chopped parsley."
        ]
      },
      {
        "id": 2,
        "title": "Margherita Pizza",
        "image":
            "https://images.pexels.com/photos/1566837/pexels-photo-1566837.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "40 min",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Preheat oven to 475°F (245°C).",
          "Spread pizza dough on a baking sheet and brush with olive oil.",
          "Spread tomato sauce evenly over the dough, leaving a small border.",
          "Arrange sliced mozzarella and basil leaves over the sauce.",
          "Bake for 12-15 minutes until crust is golden and cheese is bubbly.",
          "Remove from oven, drizzle with olive oil, slice, and serve hot."
        ]
      },
      {
        "id": 3,
        "title": "Tiramisu",
        "image":
            "https://images.pexels.com/photos/7783240/pexels-photo-7783240.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Complex",
        "affordability": "Moderate",
        "steps": [
          "Brew strong coffee and let it cool to room temperature.",
          "In a bowl, whisk egg yolks and sugar until pale and creamy.",
          "Add mascarpone cheese and mix until smooth.",
          "In another bowl, whip heavy cream until stiff peaks form.",
          "Gently fold whipped cream into the mascarpone mixture.",
          "Quickly dip ladyfinger biscuits into the coffee and layer them in a dish.",
          "Spread half of the mascarpone mixture over the biscuits.",
          "Repeat with another layer of coffee-soaked biscuits and mascarpone mixture.",
          "Chill in the refrigerator for at least 4 hours before serving.",
          "Dust with cocoa powder just before serving."
        ]
      },
    ],
    "German": [
      {
        "id": 1,
        "title": "Sauerbraten",
        "image":
            "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "2 hrs",
        "complexity": "Complex",
        "affordability": "Moderate",
        "steps": [
          "Marinate beef roast in a mixture of vinegar, water, onions, and spices for 3-5 days in the refrigerator.",
          "Remove beef from marinade and pat dry with paper towels.",
          "Heat oil in a large Dutch oven and brown the beef on all sides.",
          "Add marinade liquid and simmer, covered, for 2-3 hours until beef is tender.",
          "Remove beef and strain liquid to make gravy.",
          "Slice beef and serve with gravy, red cabbage, and dumplings."
        ]
      },
      {
        "id": 2,
        "title": "Bratwurst",
        "image":
            "https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "45 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Preheat grill to medium-high heat.",
          "Grill bratwurst for 15-20 minutes, turning occasionally, until cooked through and browned.",
          "Serve hot in a bun with mustard and sauerkraut."
        ]
      },
      {
        "id": 3,
        "title": "Kartoffelsalat",
        "image":
            "https://images.pexels.com/photos/1099681/pexels-photo-1099681.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "30 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Boil potatoes until tender, then peel and slice thinly.",
          "In a large bowl, mix sliced potatoes with sliced onions.",
          "In a separate bowl, whisk together oil, vinegar, mustard, salt, and pepper to make the dressing.",
          "Pour dressing over potatoes and onions, toss gently to coat.",
          "Chill in the refrigerator for at least 1 hour before serving."
        ]
      },
    ],
    "Asian": [
      {
        "id": 1,
        "title": "Chicken Fried Rice",
        "image":
            "https://images.pexels.com/photos/9980875/pexels-photo-9980875.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "25 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Cook rice according to package instructions and let it cool.",
          "In a large pan, heat oil over medium-high heat.",
          "Add diced chicken and cook until browned and cooked through.",
          "Push chicken to the side and add beaten eggs, scramble until cooked.",
          "Add cooked rice, soy sauce, and vegetables (like peas and carrots). Stir-fry until heated through.",
          "Serve hot, optionally garnished with sliced green onions."
        ]
      },
      {
        "id": 2,
        "title": "Pad Thai",
        "image":
            "https://images.pexels.com/photos/12481161/pexels-photo-12481161.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "35 min",
        "complexity": "Moderate",
        "affordability": "Moderate",
        "steps": [
          "Soak rice noodles in warm water until softened, then drain.",
          "In a pan, heat oil and sauté garlic and tofu until golden brown.",
          "Add shrimp and stir-fry until pink, then push to the side.",
          "Crack eggs into the pan, scramble until nearly cooked, then mix with shrimp and tofu.",
          "Add softened noodles, fish sauce, tamarind paste, and sugar. Stir-fry until well combined.",
          "Serve hot, garnished with peanuts, bean sprouts, and lime wedges."
        ]
      },
      {
        "id": 3,
        "title": "Sushi Rolls",
        "image":
            "https://images.pexels.com/photos/5900506/pexels-photo-5900506.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Complex",
        "affordability": "Moderate",
        "steps": [
          "Prepare sushi rice according to package instructions, let it cool slightly.",
          "Lay a sheet of nori on a bamboo mat, spread rice evenly over the nori, leaving a 1-inch border at the top.",
          "Arrange fillings (like sliced fish, avocado, cucumber) in a line across the center of the rice.",
          "Roll the bamboo mat tightly, pressing gently to seal the roll.",
          "Slice rolls into bite-sized pieces using a sharp knife dipped in water.",
          "Serve with soy sauce, pickled ginger, and wasabi."
        ]
      },
    ],
    "Mexican": [
      {
        "id": 1,
        "title": "Tacos al Pastor",
        "image":
            "https://images.pexels.com/photos/3642718/pexels-photo-3642718.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Marinate pork in a mixture of adobo sauce, pineapple juice, and spices for at least 2 hours.",
          "Preheat grill to medium-high heat.",
          "Grill marinated pork slices until cooked through and slightly charred.",
          "Slice grilled pork thinly and serve in warm corn tortillas with diced onion, cilantro, and pineapple chunks.",
          "Serve hot, optionally with lime wedges and salsa verde."
        ]
      },
      {
        "id": 2,
        "title": "Guacamole",
        "image":
            "https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "15 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Halve and pit avocados, then scoop flesh into a bowl.",
          "Mash avocados with a fork until smooth but still chunky.",
          "Add diced onion, tomato, cilantro, lime juice, and salt. Mix well.",
          "Taste and adjust seasoning if needed.",
          "Serve immediately with tortilla chips or as a topping for tacos."
        ]
      },
      {
        "id": 3,
        "title": "Enchiladas",
        "image":
            "https://images.pexels.com/photos/9213936/pexels-photo-9213936.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Preheat oven to 350°F (175°C).",
          "In a pan, heat oil and sauté diced onion until translucent.",
          "Add shredded chicken, diced green chilies, and spices. Cook until chicken is heated through.",
          "Spread a spoonful of enchilada sauce on each corn tortilla.",
          "Fill tortillas with chicken mixture, roll tightly, and place seam-side down in a baking dish.",
          "Pour remaining enchilada sauce over rolled tortillas, sprinkle with cheese.",
          "Bake for 20-25 minutes until cheese is melted and bubbly.",
          "Serve hot, garnished with chopped cilantro and sour cream."
        ]
      },
    ],
    "Indian": [
      {
        "id": 1,
        "title": "Chicken Tikka Masala",
        "image":
            "https://images.pexels.com/photos/2474661/pexels-photo-2474661.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Moderate",
        "affordability": "Moderate",
        "steps": [
          "Marinate chicken pieces in yogurt, ginger-garlic paste, and spices for 1-2 hours.",
          "Preheat grill or broiler to medium-high heat.",
          "Grill or broil chicken until charred and cooked through.",
          "In a separate pan, heat oil and sauté diced onion until golden brown.",
          "Add tomato puree, cream, and spices. Cook until sauce thickens.",
          "Add grilled chicken to the sauce, simmer for 10-15 minutes.",
          "Serve hot, garnished with fresh cilantro, with rice or naan."
        ]
      },
      {
        "id": 2,
        "title": "Palak Paneer",
        "image":
            "https://images.pexels.com/photos/1117862/pexels-photo-1117862.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "45 min",
        "complexity": "Moderate",
        "affordability": "Moderate",
        "steps": [
          "Blanch spinach leaves in boiling water for 2-3 minutes, then drain and rinse with cold water.",
          "Blend blanched spinach into a smooth puree.",
          "In a pan, heat oil and sauté diced onion until translucent.",
          "Add pureed spinach, spices, and cream. Cook for 10-15 minutes.",
          "Add cubed paneer (Indian cottage cheese), simmer for another 5 minutes.",
          "Serve hot, garnished with a dollop of cream, with rice or naan."
        ]
      },
      {
        "id": 3,
        "title": "Biryani",
        "image":
            "https://images.pexels.com/photos/14731635/pexels-photo-14731635.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1.5 hrs",
        "complexity": "Complex",
        "affordability": "Moderate",
        "steps": [
          "Marinate chicken pieces in yogurt, ginger-garlic paste, and spices for 1-2 hours.",
          "Parboil basmati rice with whole spices until half-cooked, then drain.",
          "In a large pot, layer half of the rice, then chicken, fried onions, and chopped herbs.",
          "Repeat with remaining rice and ingredients, ending with a layer of rice.",
          "Sprinkle saffron milk and ghee over the top layer of rice.",
          "Cover tightly and cook on low heat for 30-40 minutes until rice and chicken are fully cooked.",
          "Serve hot, garnished with fried onions, boiled eggs, and raita (yogurt sauce)."
        ]
      },
    ],
    "French": [
      {
        "id": 1,
        "title": "Coq au Vin",
        "image":
            "https://images.pexels.com/photos/15560949/pexels-photo-15560949/free-photo-of-close-up-of-vol-au-vent-pastry-and-buns-in-a-basket.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "2 hrs",
        "complexity": "Complex",
        "affordability": "Moderate",
        "steps": [
          "Marinate chicken pieces in red wine, onions, garlic, and herbs for at least 4 hours or overnight.",
          "In a large pot, heat oil and brown chicken pieces on all sides.",
          "Remove chicken and sauté diced bacon until crispy, then add sliced mushrooms and cook until softened.",
          "Return chicken to the pot, add marinade liquid and chicken broth. Simmer, covered, for 1-1.5 hours until chicken is tender.",
          "Serve hot, garnished with chopped parsley, with crusty bread or mashed potatoes."
        ]
      },
      {
        "id": 2,
        "title": "Ratatouille",
        "image":
            "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Slice eggplant, zucchini, bell peppers, and tomatoes into thin rounds.",
          "In a large pan, heat oil and sauté sliced onions until translucent.",
          "Layer sliced vegetables in an overlapping pattern in the pan.",
          "Drizzle olive oil over the vegetables, season with salt, pepper, and herbs.",
          "Cover and cook over low heat for 30-40 minutes until vegetables are tender.",
          "Serve hot, garnished with fresh basil and grated Parmesan cheese."
        ]
      },
      {
        "id": 3,
        "title": "Crème Brûlée",
        "image":
            "https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1.5 hrs",
        "complexity": "Complex",
        "affordability": "Moderate",
        "steps": [
          "Preheat oven to 325°F (160°C).",
          "In a saucepan, heat cream and vanilla bean until just simmering.",
          "In a bowl, whisk egg yolks and sugar until pale and creamy.",
          "Slowly pour hot cream mixture into the egg mixture, whisking constantly.",
          "Strain mixture through a fine sieve into a pouring jug.",
          "Pour custard into ramekins, place in a baking dish filled with hot water.",
          "Bake for 40-45 minutes until custard is set but still slightly jiggly in the center.",
          "Chill in the refrigerator for at least 2 hours.",
          "Sprinkle a thin layer of sugar over each custard, torch with a kitchen torch until caramelized.",
          "Serve immediately, garnished with berries."
        ]
      },
    ],
    "Greek": [
      {
        "id": 1,
        "title": "Moussaka",
        "image":
            "https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "2 hrs",
        "complexity": "Complex",
        "affordability": "Moderate",
        "steps": [
          "Slice eggplant into rounds, sprinkle with salt, and let sit for 30 minutes to draw out moisture.",
          "Pat dry eggplant slices and brush with olive oil, then bake at 400°F (200°C) until tender and slightly browned.",
          "In a pan, heat oil and sauté diced onions until translucent.",
          "Add ground lamb or beef, garlic, cinnamon, and oregano. Cook until meat is browned.",
          "Stir in tomato paste, chopped tomatoes, and red wine. Simmer until sauce thickens.",
          "Layer baked eggplant slices with meat sauce in a baking dish.",
          "Prepare a béchamel sauce with butter, flour, milk, and nutmeg. Pour over the layers.",
          "Bake moussaka for 45-50 minutes until golden and bubbling.",
          "Let rest for 15-20 minutes before serving."
        ]
      },
      {
        "id": 2,
        "title": "Greek Salad",
        "image":
            "https://images.pexels.com/photos/803963/pexels-photo-803963.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "15 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Chop tomatoes, cucumber, bell pepper, and red onion into bite-sized pieces.",
          "In a large bowl, combine chopped vegetables with Kalamata olives and feta cheese.",
          "Drizzle olive oil and red wine vinegar over the salad, season with salt and oregano.",
          "Toss gently to combine, ensuring vegetables are evenly coated.",
          "Serve immediately, garnished with additional feta cheese and fresh herbs."
        ]
      },
      {
        "id": 3,
        "title": "Spanakopita",
        "image":
            "https://images.pexels.com/photos/750073/pexels-photo-750073.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1 hr",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Thaw frozen spinach and squeeze out excess moisture.",
          "In a bowl, mix spinach with crumbled feta cheese, chopped onions, dill, and eggs.",
          "Melt butter and brush one sheet of phyllo pastry with butter.",
          "Repeat layering and buttering with 5-6 sheets of phyllo pastry.",
          "Spread spinach and feta mixture evenly over the layered phyllo pastry.",
          "Fold overhanging edges of phyllo pastry over the filling, then roll into a log shape.",
          "Brush the top with butter and bake at 375°F (190°C) for 30-35 minutes until golden brown.",
          "Let cool slightly before slicing and serving."
        ]
      },
    ],
    "Spanish": [
      {
        "id": 1,
        "title": "Paella",
        "image":
            "https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "1.5 hrs",
        "complexity": "Moderate",
        "affordability": "Moderate",
        "steps": [
          "Heat olive oil in a large paella pan or skillet.",
          "Sauté diced onion, bell pepper, and garlic until softened.",
          "Add sliced chorizo and cook until lightly browned.",
          "Stir in rice and cook for 1-2 minutes until translucent.",
          "Add saffron, paprika, and diced tomatoes. Stir to combine.",
          "Pour in chicken broth and bring to a boil, then reduce heat to low.",
          "Arrange shrimp, mussels, and chicken pieces over the rice.",
          "Simmer, covered, for 15-20 minutes until rice is cooked and seafood is opaque.",
          "Garnish with lemon wedges and chopped parsley before serving."
        ]
      },
      {
        "id": 2,
        "title": "Gazpacho",
        "image":
            "https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "20 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "In a blender, combine chopped tomatoes, cucumber, bell pepper, onion, and garlic.",
          "Blend until smooth, adding olive oil and vinegar gradually.",
          "Season with salt, pepper, and a pinch of cayenne pepper.",
          "Chill gazpacho in the refrigerator for at least 2 hours before serving.",
          "Serve cold, garnished with diced cucumber, croutons, and a drizzle of olive oil."
        ]
      },
      {
        "id": 3,
        "title": "Patatas Bravas",
        "image":
            "https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "45 min",
        "complexity": "Moderate",
        "affordability": "Affordable",
        "steps": [
          "Preheat oven to 425°F (220°C).",
          "Cut potatoes into small cubes and toss with olive oil, salt, and smoked paprika.",
          "Spread potatoes in a single layer on a baking sheet and roast for 30-35 minutes until crispy and golden brown.",
          "Meanwhile, prepare bravas sauce by sautéing diced onion and garlic until softened.",
          "Stir in tomato paste, smoked paprika, and cayenne pepper. Cook for 1-2 minutes.",
          "Add chicken broth and simmer until sauce thickens.",
          "Serve roasted potatoes with bravas sauce drizzled on top, garnished with chopped parsley."
        ]
      },
    ],
    "American": [
      {
        "id": 1,
        "title": "Cheeseburger",
        "image":
            "https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "30 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Preheat grill or skillet over medium-high heat.",
          "Form ground beef into patties and season with salt and pepper.",
          "Grill or cook patties for 4-5 minutes per side until cooked through.",
          "Toast hamburger buns on the grill or skillet until lightly browned.",
          "Assemble burgers with lettuce, tomato, onion, cheese, and condiments of choice.",
          "Serve hot with fries or potato chips."
        ]
      },
      {
        "id": 2,
        "title": "Macaroni and Cheese",
        "image":
            "https://images.pexels.com/photos/2983101/pexels-photo-2983101.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "40 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Cook macaroni in boiling salted water until al dente, then drain and set aside.",
          "In a saucepan, melt butter over medium heat.",
          "Whisk in flour and cook for 1-2 minutes until golden brown.",
          "Gradually whisk in milk and bring to a simmer, stirring constantly.",
          "Stir in shredded cheese until melted and smooth.",
          "Combine cheese sauce with cooked macaroni until evenly coated.",
          "Transfer to a baking dish, sprinkle with breadcrumbs if desired.",
          "Bake at 350°F (175°C) for 20-25 minutes until bubbly and golden on top.",
          "Let cool slightly before serving."
        ]
      },
      {
        "id": 3,
        "title": "BBQ Ribs",
        "image":
            "https://images.pexels.com/photos/1583884/pexels-photo-1583884.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "3 hrs",
        "complexity": "Moderate",
        "affordability": "Moderate",
        "steps": [
          "Preheat oven to 300°F (150°C).",
          "Rub pork ribs with a mixture of salt, pepper, paprika, and garlic powder.",
          "Wrap ribs tightly in aluminum foil and bake for 2.5-3 hours until tender.",
          "Meanwhile, prepare BBQ sauce by combining ketchup, brown sugar, vinegar, and spices in a saucepan.",
          "Simmer sauce over low heat for 15-20 minutes until flavors meld.",
          "Remove ribs from foil, brush with BBQ sauce, and grill or broil for 5-10 minutes until sauce is caramelized.",
          "Serve hot, garnished with chopped green onions."
        ]
      },
    ],
    "Thai": [
      {
        "id": 1,
        "title": "Pad See Ew",
        "image":
            "https://images.pexels.com/photos/22703386/pexels-photo-22703386/free-photo-of-pouring-hot-chocolate-to-cup.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "30 min",
        "complexity": "Simple",
        "affordability": "Affordable",
        "steps": [
          "Soak wide rice noodles in warm water until softened, then drain.",
          "In a pan, heat oil and stir-fry sliced chicken until cooked through.",
          "Add sliced garlic, broccoli florets, and noodles to the pan. Stir-fry until broccoli is tender-crisp.",
          "Push everything to the side and crack an egg into the pan, scramble until nearly cooked.",
          "Add soy sauce, oyster sauce, and a pinch of sugar. Stir-fry until well combined.",
          "Serve hot, garnished with sliced green onions and a lime wedge."
        ]
      },
      {
        "id": 2,
        "title": "Tom Yum Soup",
        "image":
            "https://images.pexels.com/photos/10799729/pexels-photo-10799729.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "30 min",
        "complexity": "Simple",
        "affordability": "Moderate",
        "steps": [
          "In a pot, bring chicken broth to a boil.",
          "Add lemongrass, galangal (or ginger), kaffir lime leaves, and chili paste.",
          "Simmer for 5 minutes to infuse flavors.",
          "Add shrimp, mushrooms, and tomatoes. Cook until shrimp are pink and opaque.",
          "Stir in fish sauce, lime juice, and sugar to taste.",
          "Remove from heat and garnish with cilantro leaves.",
          "Serve hot as a soup or with steamed rice."
        ]
      },
      {
        "id": 3,
        "title": "Green Curry Chicken",
        "image":
            "https://images.pexels.com/photos/1092730/pexels-photo-1092730.jpeg?auto=compress&cs=tinysrgb&w=600",
        "duration": "45 min",
        "complexity": "Moderate",
        "affordability": "Moderate",
        "steps": [
          "In a blender, combine green curry paste, garlic, shallots, lemongrass, and ginger. Blend into a smooth paste.",
          "In a pot, heat coconut milk over medium heat until simmering.",
          "Add curry paste mixture and stir-fry for 1-2 minutes until fragrant.",
          "Add sliced chicken, eggplant, bell peppers, and bamboo shoots.",
          "Simmer for 15-20 minutes until chicken is cooked and vegetables are tender.",
          "Stir in fish sauce, sugar, and Thai basil leaves.",
          "Serve hot, garnished with Thai basil leaves, with steamed jasmine rice."
        ]
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> recipe = recipes[category]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipe.length,
        itemBuilder: (ctx, index) {
          final recipeItem = recipe[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(
                    id: recipeItem['id'],
                    category: category,
                    data: recipeItem,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          recipeItem['image'],
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          color: Colors.black54,
                          width: 300,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 20,
                          ),
                          child: Text(
                            recipeItem['title'],
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.schedule),
                            const SizedBox(width: 6),
                            Text(recipeItem['duration']),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.work),
                            const SizedBox(width: 6),
                            Text(recipeItem['complexity']),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(width: 6),
                            Text(recipeItem['affordability']),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final int id;
  final String category;
  final dynamic data;

  const RecipeDetailPage({
    Key? key,
    required this.id,
    required this.category,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Recipe Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                data['title'],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Image.network(
                data['image'],
                height: 200,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Duration: ${data["duration"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Complexity: ${data["complexity"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Affordability: ${data["affordability"]}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Steps:',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data['steps'].length,
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(data['steps'][index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
