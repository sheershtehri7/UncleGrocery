import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss_e_commerce/Pages/bottomnavbar.dart';
import 'package:ss_e_commerce/Pages/homepage.dart';
import 'package:ss_e_commerce/Pages/loginpage.dart';
import 'package:ss_e_commerce/Pages/starter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => (FirebaseAuth.instance.currentUser != null)
                  ? Bottomnavbar()
                  : Starter()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 235, 41),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 227, 205),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        ' Uncle Grocery',
                        style: GoogleFonts.oswald(
                            fontWeight: FontWeight.w600, fontSize: 45),
                      ),
                    ),
                    width: screenWidth * 0.80,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Your Family, Our Family',
                        style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ),
                    width: screenWidth * 0.80,
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
            SizedBox(
              height: screenHeight * 0.10,
            ),
            SpinKitCircle(
              color: const Color.fromARGB(255, 0, 0, 0),
              size: 70,
            ),
            SizedBox(
              height: screenHeight * 0.10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              height: screenHeight * 0.06,
              width: screenWidth * 0.6,
              child: Image.asset(
                'assets/1.png',
                fit: BoxFit.contain,
              ),
            )
          ],
        ));
  }
}
