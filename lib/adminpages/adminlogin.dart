import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss_e_commerce/adminpages/admin_home.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  adminloginn() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (emailcontroller.text == "" || passwordcontroller.text == "") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Please fill all the details!',
                style: TextStyle(fontSize: 18),
              )));
        } else if (result.data()['Username'] != emailcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Incorrect Username!',
                style: TextStyle(fontSize: 15),
              )));
        } else if (result.data()['password'] !=
            passwordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Incorrect Password!',
                style: TextStyle(fontSize: 15),
              )));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AdminHome()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 41),
      body: Column(
        children: [
          // Place the back arrow icon at the top left corner
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),

          // Adjust the header section for "User Login"
          Container(
            height: screenHeight * 0.2,
            child: Center(
              child: Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: [
                        Text(
                          'Admin Portal',
                          style: GoogleFonts.oswald(
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' Please enter the details below to continue.',
                            style: GoogleFonts.notoSerifOttomanSiyaq(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content Section
          Expanded(
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 228, 227, 205),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(59),
                  topRight: Radius.circular(59),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 226, 226, 226),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '  Email',
                              labelText: '  Enter Your Email'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 226, 226, 226),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '  Password',
                              labelText: '  Enter Your Password'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      adminloginn();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: Center(
                        child: Container(
                          child: Text(
                            ' Enter Portal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
