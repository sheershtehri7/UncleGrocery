import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';
import 'package:ss_e_commerce/Pages/bottomnavbar.dart';
import 'package:ss_e_commerce/Pages/homepage.dart';
import 'package:ss_e_commerce/Pages/loginpage.dart';
import 'package:ss_e_commerce/services/database.dart';
import 'package:ss_e_commerce/services/sharedpreference.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});
  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  String? name, email, password, confirmpassword;
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController confirmpasswordcontroller = new TextEditingController();
  void createAccount() async {
    String name = namecontroller.text.trim();
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();
    String cpassword = confirmpasswordcontroller.text.trim();
    if (name == "" || email == "" || password == "" || cpassword == "") {
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
    } else if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Password should be at least 8 characters',
            style: TextStyle(fontSize: 18),
          )));
    } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Password must contain at least one uppercase letter',
            style: TextStyle(fontSize: 18),
          )));
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Password must contain at least one number',
            style: TextStyle(fontSize: 18),
          )));
    } else if (password != cpassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Passwords do not match!',
            style: TextStyle(fontSize: 18),
          )));
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Account Created Successfully',
              style: TextStyle(fontSize: 18),
            )));
        if (userCredential != null) {
          String Id = randomAlphaNumeric(10);
          await SharedPreferenceHelper().saveUserEmail(emailcontroller.text);
          await SharedPreferenceHelper().saveUserId(Id);
          await SharedPreferenceHelper().saveUserImage(
            "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg",
          );
          await SharedPreferenceHelper().saveUserName(namecontroller.text);
          Map<String, dynamic> userInfoMap = {
            "Name": namecontroller.text,
            "Email": emailcontroller.text,
            "Id": Id,
            "Image":
                "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg",
          };
          await DatabaseMethods().addUserDetails(userInfoMap, Id);
          Navigator.popUntil(context, (Route) => Route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Bottomnavbar()));
        }
      } on FirebaseAuthException catch (e) {
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
                          'User SignUp',
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
                          controller: namecontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '  Name',
                              labelText: '  Enter Your Name'),
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
                          controller: confirmpasswordcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '  Confirm Password',
                              labelText: '  Confirm Your Password'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      createAccount();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: Center(
                        child: Container(
                          child: Text(
                            ' Sign Up',
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
                  Padding(
                    padding: EdgeInsets.only(right: 20, top: 25, left: 20),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Already have an account ?',
                        style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, top: 2, left: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()));
                      },
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 101, 111, 7),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      double screenWidth, String text, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 55,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.exo(
              color: textColor,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
