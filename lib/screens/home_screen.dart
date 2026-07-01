import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;
  int selectedBottom = 0;

  final List<String> categories = ["All", "Combos", "Sliders", "Classic"];

  final List<Map<String, dynamic>> foods = [
    {
      "image": "assets/images/burger1.png",
      "title": "Cheeseburger",
      "subtitle": "Wendy's Burger",
      "rating": "4.9",
    },
    {
      "image": "assets/images/burger2.png",
      "title": "Hamburger",
      "subtitle": "Veggie Burger",
      "rating": "4.8",
    },
    {
      "image": "assets/images/burger3.png",
      "title": "Hamburger",
      "subtitle": "Chicken Burger",
      "rating": "4.6",
    },
    {
      "image": "assets/images/burger4.png",
      "title": "Hamburger",
      "subtitle": "Fried Chicken Burger",
      "rating": "4.5",
    },
  ];

  Widget bottomNavItem({required String icon, required int index}) {
    final bool isSelected = selectedBottom == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedBottom = index);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, height: 24),

              const SizedBox(height: 6),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isSelected ? 6 : 0,
                height: isSelected ? 6 : 0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          width: 82,
          height: 82,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFFF7C91B), // Inner circle
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  "assets/icons/add.png",
                  width: 28,
                  height: 28,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: SizedBox(
        height: 85,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/icons/bottom_navigation.png",
                fit: BoxFit.fill,
              ),
            ),

            // Navigation Icons
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Row(
                  children: [
                    bottomNavItem(icon: "assets/icons/home.png", index: 0),

                    bottomNavItem(icon: "assets/icons/profile.png", index: 1),

                    const SizedBox(width: 78),

                    bottomNavItem(icon: "assets/icons/bag.png", index: 2),

                    bottomNavItem(icon: "assets/icons/heart.png", index: 3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 12),

              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Foodgo",
                        style: GoogleFonts.lobster(
                          fontSize: 45,

                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF3C2F2F),
                        ),
                      ),

                      Text(
                        "Order your favourite food!",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF6A6A6A),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/user_profile_image.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// Search
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.19),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: TextField(
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2E2E2E),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 19,
                          ),
                          hintStyle: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF3C2F2F),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              "assets/icons/search.png",
                              width: 22,
                              height: 22,
                            ),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 56,
                            minHeight: 56,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7C91B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Image.asset("assets/icons/filter.png"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// Categories
              SizedBox(
                height: 45,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    bool selected = selectedCategory == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: selected
                              ? const Color(0xFFF7C91B)
                              : const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: selected
                              ? [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                      100,
                                      0,
                                      0,
                                      0,
                                    ), // ~16% opacity
                                    offset: const Offset(0, 7),
                                    blurRadius: 17,
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          categories[index],
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: selected
                                ? const Color(0xFF2B2D42)
                                : const Color(0xFF6A6A6A),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, _) => const SizedBox(width: 14),
                  itemCount: categories.length,
                ),
              ),

              const SizedBox(height: 32),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 4, bottom: 28),
                    itemCount: foods.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 225,
                        ),
                    itemBuilder: (_, index) {
                      final food = foods[index];

                      return SizedBox(
                        width: 185,
                        height: 225,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                offset: const Offset(0, 6),
                                blurRadius: 10,
                                spreadRadius: -2,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),

                              /// Burger Image
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Center(
                                  child: SizedBox(
                                    height: 100,
                                    child: Image.asset(
                                      food["image"],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                ),
                                child: Text(
                                  food["title"],
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF3A3030),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                ),
                                child: Text(
                                  food["subtitle"],
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF6B6B6B),
                                  ),
                                ),
                              ),

                              const Spacer(),

                              Padding(
                                padding: EdgeInsets.only(
                                  left: 14,
                                  right: 14,
                                  bottom: 12,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/icons/star.png",
                                      width: 16,
                                      height: 16,
                                    ),

                                    const SizedBox(width: 5),

                                    Text(
                                      food["rating"],
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    const Spacer(),

                                    Image.asset(
                                      "assets/icons/like.png",
                                      width: 24,
                                      height: 24,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
