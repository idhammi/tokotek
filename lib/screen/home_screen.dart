import 'package:flutter/material.dart';
import 'package:tokotek/data/sample.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.discount_outlined),
              Column(
                children: [
                  Text(
                    "Delivery Adress",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "92 High Street, London",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Icon(Icons.notifications_none_outlined),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF0F1F2),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 8),
                    Text("Search the entire shop"),
                    SizedBox(height: 8),
                    Text("Delivery is 50% cheaper"),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text("See all"),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Categories(),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              "Flash Sale",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text("See all"),
                            Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Products(),
                      SizedBox(height: 16),
                    ],
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

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categoryList.map((category) {
            return Container(
              decoration: const BoxDecoration(color: Colors.red),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Image.asset(
                    category.icon,
                    width: 64,
                    height: 64,
                  ),
                  Text(category.name),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(color: Colors.green),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  productList[index].image,
                  width: 120,
                  height: 120,
                ),
                Text(productList[index].name),
              ],
            ),
          ),
        );
      },
    );
  }
}
