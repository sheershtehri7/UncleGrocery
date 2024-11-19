import 'package:flutter/material.dart';
import 'package:ss_e_commerce/Pages/insidecategorypage.dart';
import 'package:ss_e_commerce/widgets/categorywidget.dart';

class Categoriespage extends StatefulWidget {
  const Categoriespage({super.key});

  @override
  State<Categoriespage> createState() => _CategoriespageState();
}

class _CategoriespageState extends State<Categoriespage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.45,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                screenWidth * 0.4, // Controls the maximum width of each item

            crossAxisSpacing: 10,
          ),
          itemCount: CategoryData.categories.length,
          itemBuilder: (context, index) {
            final category = CategoryData.categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Insidecategorypage(category: category.name)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        category.Image,
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.12,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        category.name,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475269)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
