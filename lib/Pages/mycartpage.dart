import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: screenHeight * 0.15,
            width: screenWidth,
            color: const Color.fromARGB(255, 235, 235, 41),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Cart',
                          style: GoogleFonts.notoSerifOttomanSiyaq(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Deliciousness is Just a Tap Away!',
                          style: GoogleFonts.exo(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      CupertinoIcons.heart_circle,
                      size: 40,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Text(
                      'Items',
                      style: GoogleFonts.exo(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Row(
                  children: [
                    Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.75,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Image.network(
                            'https://rukminim2.flixcart.com/image/280/280/l5iid8w0/snack-savourie/t/c/i/-original-imagg65fez3mdsf5.jpeg?q=70',
                          ),
                          SizedBox(
                              width: screenWidth *
                                  0.02), // Add spacing between image and text
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Kurkure',
                                    style: GoogleFonts.notoSerifOttomanSiyaq(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                      height: screenHeight *
                                          0.005), // Spacing between lines
                                  Text(
                                    'Haldiram Corp.',
                                    style: GoogleFonts.exo(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '\$2',
                            style: GoogleFonts.exo(
                              color: Colors.red,
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    Container(
                      width: screenWidth * 0.15,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        CupertinoIcons.bin_xmark_fill,
                        size: screenWidth * 0.08,
                        color: const Color.fromARGB(255, 198, 66, 57),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.75,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Image.network(
                            'https://rukminim2.flixcart.com/image/280/280/l3dcl8w0/aerated-drink/e/o/5/-original-imagegf9t2fv6hdp.jpeg?q=70',
                          ),
                          SizedBox(
                              width: screenWidth *
                                  0.02), // Add spacing between image and text
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Coca Cola',
                                    style: GoogleFonts.notoSerifOttomanSiyaq(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(
                                      height: screenHeight *
                                          0.005), // Spacing between lines
                                  Text(
                                    'ITC Corporation ltd.',
                                    style: GoogleFonts.exo(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '\$10',
                            style: GoogleFonts.exo(
                              color: Colors.red,
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    Container(
                      width: screenWidth * 0.15,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        CupertinoIcons.bin_xmark_fill,
                        size: screenWidth * 0.08,
                        color: const Color.fromARGB(255, 198, 66, 57),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.75,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.14,
                            child: Image.network(
                              'https://rukminim2.flixcart.com/image/280/280/xif0q/washing-powder/0/b/j/-original-imah6k8mjp3gpzvv.jpeg?q=70',
                            ),
                          ),
                          SizedBox(
                              width: screenWidth *
                                  0.02), // Add spacing between image and text
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Tide',
                                      style: GoogleFonts.notoSerifOttomanSiyaq(
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: screenHeight *
                                          0.005), // Spacing between lines
                                  Expanded(
                                    child: Text(
                                      'ITC Corporation ltd.',
                                      style: GoogleFonts.exo(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '\$10',
                            style: GoogleFonts.exo(
                              color: Colors.red,
                              fontSize: screenWidth * 0.07,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    Container(
                      width: screenWidth * 0.15,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        CupertinoIcons.bin_xmark_fill,
                        size: screenWidth * 0.08,
                        color: const Color.fromARGB(255, 198, 66, 57),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.008,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.black,
                    thickness: 0.4,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item Total',
                            style: GoogleFonts.exo(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '\$12',
                            style: GoogleFonts.exo(
                              color: Colors.red,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: GoogleFonts.exo(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '\$2',
                            style: GoogleFonts.exo(
                              color: Colors.red,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.exo(
                              fontSize: screenWidth * 0.063,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\$14',
                            style: GoogleFonts.exo(
                              color: Colors.red,
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Container(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.01,
                          horizontal: screenWidth * 0.05,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),

                            SizedBox(
                                width: screenWidth *
                                    0.02), // Add spacing between image and text
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Cash On Delivery',
                                      style: GoogleFonts.notoSerifOttomanSiyaq(
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(
                                        height: screenHeight *
                                            0.005), // Spacing between lines
                                    Text(
                                      'Pay on Delivery, Return available',
                                      style: GoogleFonts.exo(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              'Selected',
                              style: GoogleFonts.exo(
                                color: Colors.red,
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.015,
                      ),
                      Container(
                        height: screenHeight * 0.05,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 229, 18, 18),
                        ),
                        child: Center(
                          child: Text(
                            ' Select Address',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.exo2(
                                color: Colors.white,
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
