import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss_e_commerce/Pages/griditems.dart';

class Detailviewpage extends StatefulWidget {
  final String Name, description, Price, Image, Organization;
  Detailviewpage({
    super.key,
    required this.Name,
    required this.Price,
    required this.description,
    required this.Image,
    required this.Organization,
  });

  @override
  State<Detailviewpage> createState() => _DetailviewpageState();
}

class _DetailviewpageState extends State<Detailviewpage> {
  double discountedPrice = 0.0; // Variable to store the discounted price

  // Method to fetch the discount from Firestore
  Future<double> fetchDiscount() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Discount')
        .doc('tyQygHVba6U7aB5AYLqN')
        .get();

    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      final discount = data['Discount'];
      return discount?.toDouble() ?? 0.0; // Convert to double
    } else {
      return 0.0; // Default value if no discount is found
    }
  }

  @override
  void initState() {
    super.initState();
    _calculateDiscountedPrice(); // Call the method to calculate discounted price
  }

  // Calculate the discounted price
  Future<void> _calculateDiscountedPrice() async {
    final discount = await fetchDiscount();
    final price =
        double.tryParse(widget.Price) ?? 0.0; // Convert price to double

    if (discount > 0 && price > 0) {
      setState(() {
        discountedPrice =
            price - (price * (discount / 100)); // Calculate discounted price
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(Icons.arrow_back_rounded),
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            //  boxShadow: [
                            // BoxShadow(
                            //   color: Colors.black,
                            //   //color: Color.fromARGB(255, 90, 101, 126),
                            //   blurRadius: 0,
                            //   spreadRadius: 1,
                            // )
                            //]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(CupertinoIcons.cart_fill),
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            //  boxShadow: [
                            // BoxShadow(
                            //   color: Colors.black,
                            //   //color: Color.fromARGB(255, 90, 101, 126),
                            //   blurRadius: 0,
                            //   spreadRadius: 1,
                            // )
                            //]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(CupertinoIcons.share_up),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Image.network(
                    widget.Image,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 0,
                      color: const Color.fromARGB(255, 244, 33, 33))
                ],
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55))),
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(widget.Name,
                            style: GoogleFonts.albertSans(
                                color: Colors.black,
                                wordSpacing: 6,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(widget.Price,
                          style: GoogleFonts.spectral(
                              color: const Color.fromARGB(255, 229, 18, 18),
                              wordSpacing: 6,
                              fontWeight: FontWeight.bold,
                              fontSize: 28)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.08,
                    child: Text(widget.Organization,
                        style: GoogleFonts.exo(
                            color: Colors.black,
                            wordSpacing: 6,
                            fontWeight: FontWeight.w500,
                            fontSize: 14)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    color: const Color.fromARGB(31, 255, 44, 44),
                    height: MediaQuery.of(context).size.width * 0.08,
                    child: Center(
                      child: Text(" SPECIAL OFFER",
                          style: GoogleFonts.exo(
                              color: Colors.black,
                              wordSpacing: 6,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                    ),
                  ),
                ),
                StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Discount')
                        .doc('tyQygHVba6U7aB5AYLqN')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      }
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return Center(child: Text("Discount data not found"));
                      }
                      final data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      final discount = data['Discount'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Container(
                          color: const Color.fromARGB(255, 230, 232, 132),
                          height: MediaQuery.of(context).size.width * 0.05,
                          child: Center(
                            child: Text("$discount % OFF",
                                style: GoogleFonts.exo(
                                    color: Colors.black,
                                    wordSpacing: 6,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14)),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: screenHeight * 0.025,
                ),
                Container(
                  color: const Color.fromARGB(77, 125, 125, 125),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Trending Products',
                                style: GoogleFonts.exo(
                                    color: Colors.black,
                                    wordSpacing: 6,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Text(
                              'See All',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Listbestseling()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                (widget.Price),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              ' 1̶0̶\$ MRP',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Inclusive of all Taxes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 237, 36),
                        ),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: screenWidth * 0.45,
                        child: Center(
                          child: Text("Add to Cart",
                              style: GoogleFonts.exo(
                                  color: Colors.black,
                                  wordSpacing: 6,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
