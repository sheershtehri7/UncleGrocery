import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss_e_commerce/Pages/loginpage.dart';
import 'package:ss_e_commerce/adminpages/adminlogin.dart';

class Starter extends StatefulWidget {
  const Starter({super.key});

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 235, 41),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.5,
              child: Center(
                child: Container(
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 228, 227, 205),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Center(
                        child: Center(
                          child: Container(
                            child: Center(
                              child: Text(
                                ' Uncle Grocery',
                                style: GoogleFonts.oswald(
                                    fontWeight: FontWeight.w600, fontSize: 45),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Your Family, Our Family',
                              style: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                          ),
                          width: screenWidth * 0.80,
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.food_bank_rounded,
                          size: screenHeight * 0.07,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.5,
              width: screenWidth * 1,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 227, 205),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(59),
                      topRight: Radius.circular(59))),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome',
                        style: GoogleFonts.notoSerifOttomanSiyaq(
                            fontSize: 34, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Welcome to Uncle Grocery, where Foodie Meets Food Creators, Get all the delicious food from your nearest store, on just One Tap.',
                        style: GoogleFonts.notoSerifOttomanSiyaq(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.04,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Loginpage()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 55,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  'User',
                                  style: GoogleFonts.exo(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Adminlogin()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              height: 55,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  '  Admin',
                                  style: GoogleFonts.exo(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
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
        ));
  }
}
