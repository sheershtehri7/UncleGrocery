import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss_e_commerce/Pages/bottomnavbar.dart';
import 'package:ss_e_commerce/Pages/homepage.dart';
import 'package:ss_e_commerce/Pages/signup.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  String? email, password;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  void Login() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    if (email == "" || password == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Please fill all the details!',
            style: TextStyle(fontSize: 18),
          )));
    } else if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Enter a valid email address',
            style: TextStyle(fontSize: 18),
          )));
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.popUntil(context, (Route) => Route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Bottomnavbar()));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "invalid-credential") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                'Please Check Your Email and Password!',
                style: TextStyle(fontSize: 15),
              )));
        } else
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                e.code.toString(),
                style: TextStyle(fontSize: 18),
              )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 41),
      resizeToAvoidBottomInset: true, // Allows resizing when keyboard is open
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow icon
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
              ),

              // Header Section
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
                              'User Login',
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

              // Form Section
              Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 227, 205),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(59),
                    topRight: Radius.circular(59),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      _buildTextField(
                          controller: emailcontroller,
                          hintText: 'Email',
                          labelText: 'Enter Your Email'),
                      _buildTextField(
                          controller: passwordcontroller,
                          hintText: 'Password',
                          labelText: 'Enter Your Password',
                          obscureText: true),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 101, 111, 7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      InkWell(
                        onTap: Login,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 90),
                          child: Center(
                            child: Text(
                              ' LOGIN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
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
                      SizedBox(height: 10),
                      Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signuppage()));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 101, 111, 7),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 30),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 226, 226, 226),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              labelText: labelText,
            ),
          ),
        ),
      ),
    );
  }
}
