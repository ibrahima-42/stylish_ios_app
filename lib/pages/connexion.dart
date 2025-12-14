import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/components/facebook.dart';
import 'package:stylish/components/google.dart';
import 'package:stylish/hooks/color.dart';
import 'package:stylish/pages/register.dart';
import 'package:stylish/pages/forgot.dart';
import 'package:stylish/pages/started.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordEmpty = false;
  bool isUserEmpty = false;
  bool showPassword = false;

  void validate(){
    setState(() {
      isUserEmpty = _userController.text.trim().isEmpty;
      isPasswordEmpty = _passwordController.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                "Welcome\nBack!",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 36),
              CupertinoTextField(
                onChanged: (value) {
                  if (isUserEmpty && value.isNotEmpty) {
                    setState(() {
                      isUserEmpty = false;
                    });
                  }
                },
                controller: _userController,
                decoration: BoxDecoration(
                  color: ColorApp.inputColor,
                  border: Border.all(color: ColorApp.greyColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                style: TextStyle(color: ColorApp.textInputColor),
                placeholder: "Username or Email",
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 4),
                  child: SvgPicture.asset("assets/images/User.svg"),
                ),
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8),
              ),
              if (isUserEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 9.0),
                  child: Text(
                    "Username or Email is required",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 31),
              CupertinoTextField(
                onChanged: (value) {
                  if (isPasswordEmpty && value.isNotEmpty) {
                    setState(() {
                      isPasswordEmpty = false;
                    });
                  }
                },
                controller: _passwordController,
                decoration: BoxDecoration(
                  color: ColorApp.inputColor,
                  border: Border.all(color: ColorApp.greyColor),
                  borderRadius: BorderRadius.circular(16),
                ),
                style: TextStyle(color: ColorApp.textInputColor),
                placeholder: "Password",
                obscureText: showPassword ? false : true,
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 4),
                  child: SvgPicture.asset("assets/images/lock.svg"),
                ),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: showPassword ? Icon(Icons.visibility_off, color: ColorApp.greyColor) : Icon(Icons.visibility, color: ColorApp.greyColor),
                ),
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8),
              ),
              if (isPasswordEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 9.0),
                  child: Text(
                    "Password is required",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 9),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Forgot()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: ColorApp.primaryColor),
                  ),
                ),
              ),
              const SizedBox(height: 52),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Started()));
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorApp.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 75),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "- OR Continue with -",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 91, 89, 89),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Google(),
                  const SizedBox(width: 20),
                  Facebook(),
                  const SizedBox(width: 20),
                  Google(),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create An Account"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: ColorApp.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
