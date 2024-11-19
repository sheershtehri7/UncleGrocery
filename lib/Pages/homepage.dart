import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss_e_commerce/Pages/CategoriesPage.dart';
import 'package:ss_e_commerce/Pages/CategoryNav.dart';
import 'package:ss_e_commerce/Pages/griditems.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: screenHeight * 0.22,
          width: screenWidth * 1,
          color: const Color.fromARGB(255, 235, 235, 41),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'UNCLE GROCERY',
                        style: GoogleFonts.notoSerifOttomanSiyaq(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'At Your Doorstep',
                        style: GoogleFonts.exo(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Icon(
                    CupertinoIcons.profile_circled,
                    size: 50,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color.fromARGB(255, 90, 101, 126),
                  //     blurRadius: 5,
                  //     spreadRadius: 1,
                  //   )
                  // ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: screenHeight * 0.06,
                width: screenWidth * 0.98,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Grocery',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    Icon(Icons.search_outlined)
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Categories',
                          style: GoogleFonts.exo(
                              color: Colors.black,
                              wordSpacing: 6,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Categorynav()));
                        },
                        child: Container(
                          child: Text(
                            'See All',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 0, 0),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Categoriespage(),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Best Selling Items',
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
        ),
      ],
    ));
  }
}
