import 'package:flutter/material.dart';
import 'package:futursity/controller/auth/auth.dart';
import 'package:futursity/utils/colors.dart';
import 'package:futursity/utils/contants.dart';
import 'package:futursity/view/navigation/navbar.dart';
import 'package:futursity/view/signin_screen/signin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Image(width: 120, image: AssetImage('assets/logooo.png')),
                Text(
                  'Futursity',
                  style: TextStyle(
                    color: Color.fromARGB(255, 39, 96, 41),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            kheight25,
            SizedBox(
              height: screenSize.height * 0.065,
              width: screenSize.width * 0.9,
              child: TextFormField(
                controller: _emailController,
                validator: (val) =>
                    val != null && val.isNotEmpty ? null : 'Required Field',
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Colors.black45, // Border color in normal state
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          color:
                              Colors.black45, // Border color in focused state
                          width: 1),
                    ),
                    hintText: 'Enter your E-mail',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
                style: const TextStyle(color: Colors.black45),
              ),
            ),
            kheight10,
            SizedBox(
              height: screenSize.height * 0.065,
              width: screenSize.width * 0.9,
              child: TextFormField(
                controller: _passwordController,
                validator: (val) =>
                    val != null && val.isNotEmpty ? null : 'Required Field',
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Colors.black45, // Border color in normal state
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                          color:
                              Colors.black45, // Border color in focused state
                          width: 1),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
                style: const TextStyle(color: Colors.black45),
              ),
            ),
            kheight20,
            ElevatedButton(
              onPressed: () {
                authServices().userLogin(
                    context: context,
                    email: _emailController.text.trim(),
                    password: _passwordController.text.trim());
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const BottomNavBar()));
              },
              style: ElevatedButton.styleFrom(
                primary: kred,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: screenSize.height * 0.044,
                  width: screenSize.width * 0.9,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: screenSize.width * 0.04,
                          color: kwhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            kheight30,
            const Text(
              'Login with Phone',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color: Color.fromARGB(255, 50, 230, 236),
                  fontWeight: FontWeight.bold),
            ),
            kheight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't Have an Account ? ",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignPage()));
                  },
                  child: const Text(
                    "Register Now",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        color: kred,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            kheight30,
            Text(
              'Forget Password ?',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: screenSize.width * 0.03,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
