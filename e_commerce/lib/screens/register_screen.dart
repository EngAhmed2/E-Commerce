import 'package:e_commerce/const_variable/colors.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/blue_logo.png',
                    height: 72,
                    width: 72,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Let’s Get Started',
                    style: TextStyle(
                      color: Color(0xFF223263),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Create an new account',
                    style: TextStyle(
                      color: myNeutralGray,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  TextFormField(
                    readOnly: false,
                    decoration: const InputDecoration(
                      hintText: 'Full Name',
                      prefixIcon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    readOnly: false,
                    decoration: const InputDecoration(
                      hintText: 'Your Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    readOnly: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    readOnly: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password Again',
                      prefixIcon: Icon(Icons.lock_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF40BFFF),
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        57,
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'have a account?',
                        style: TextStyle(
                          color: Color(0xFF9098B1),
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color(0xFF40BFFF),
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
