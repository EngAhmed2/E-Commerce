import 'package:e_commerce/const_variable/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/blue_logo.png',
                      height: 72,
                      width: 72,
                    ),
                  ],
                ), // App logo
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome to Lafyuu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff223263),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9098B1),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  readOnly: false,
                  decoration: const InputDecoration(
                    hintText: 'Your Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                ), // email
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
                ), // password
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff40BFFF),
                      fixedSize: Size(
                          MediaQuery.of(context).size.width, // width
                          57 // height
                          )),
                  child: const Text('Sign in'),
                ), // sign up button
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFEBF0FF),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 28, right: 23),
                      child: const Text(
                        'OR',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF9098B1),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFEBF0FF),
                      ),
                    ),
                  ],
                ), // OR Line
                const SizedBox(
                  height: 8,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('assets/images/Google.png'),
                  label: const Text(
                    'Login with google',
                    style: TextStyle(
                      color: Color(0xFF9098B1),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width, // width
                      57, // height
                    ),
                  ),
                ), // login with google
                const SizedBox(
                  height: 4,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook_outlined),
                  label: const Text(
                    'Login with google',
                    style: TextStyle(
                      color: Color(0xFF9098B1),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFEBF0FF),
                    ),
                    fixedSize: Size(
                        MediaQuery.of(context).size.width, // width
                        57 // height
                        ),
                  ),
                ), // login with facebook
                const SizedBox(
                  height: 4,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: Color(0xFF40BFFF),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have a account?',
                      style: TextStyle(
                        color: myNeutralGray,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                    //
                    InkWell(
                      onTap: () {
                        Navigator.popAndPushNamed(context, "RegisterScreen");
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: myBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
