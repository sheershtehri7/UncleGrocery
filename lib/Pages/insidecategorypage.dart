import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ss_e_commerce/Pages/bottomnavbar.dart';
import 'package:ss_e_commerce/Pages/detailviewpage.dart';
import 'package:ss_e_commerce/adminpages/discount.dart';
import 'package:ss_e_commerce/services/database.dart';

class Insidecategorypage extends StatefulWidget {
  final String category; // 'final' is recommended for required properties.

  Insidecategorypage({required this.category});

  @override
  State<Insidecategorypage> createState() => _InsidecategorypageState();
}

class _InsidecategorypageState extends State<Insidecategorypage> {
  Stream<QuerySnapshot>? categoryStream;

  @override
  void initState() {
    super.initState();
    fetchCategoryStream();
  }

  void fetchCategoryStream() async {
    categoryStream = await DatabaseMethods().getProducts(widget.category);
    print("Category Stream initialized: $categoryStream");
    setState(() {});
  }

  Widget buildProductsGrid() {
    return StreamBuilder<QuerySnapshot>(
      stream: categoryStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("No products found in this category"));
        }

        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detailviewpage(
                      Name: ds["Name"],
                      Price: ds["Price"],
                      description: ds["Description"],
                      Image: ds["Image"],
                      Organization: "Product By - Uncle Grocery",
                    ),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ds["Image"] ?? "https://via.placeholder.com/150",
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        ds["Name"] ?? "Unknown Product",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF475269),
                        ),
                      ),
                    ),
                    Text(
                      ds["Price"] ?? "Price not available",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen.
          },
        ),
        title: Text(widget.category),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: buildProductsGrid()),
          ],
        ),
      ),
    );
  }
}
