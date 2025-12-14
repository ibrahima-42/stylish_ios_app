import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/components/facebook.dart';
import 'package:stylish/components/google.dart';
import 'package:stylish/hooks/color.dart';
import 'package:stylish/pages/connexion.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool isUserEmpty = false;
  bool isPasswordEmpty = false;
  bool isConfirmPasswordEmpty = false;
  bool showPassword = false;
  bool showConfirmPassword = false;

  void validate() {
    setState(() {
      isUserEmpty = _userController.text.trim().isEmpty;
      isPasswordEmpty = _passwordController.text.trim().isEmpty;
      isConfirmPasswordEmpty = _confirmPasswordController.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  "Create an\naccount",
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
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: ColorApp.greyColor),
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
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: ColorApp.greyColor),
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
                    icon: showPassword
                        ? Icon(Icons.visibility_off, color: ColorApp.greyColor)
                        : Icon(Icons.visibility, color: ColorApp.greyColor),
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
                const SizedBox(height: 31),
                CupertinoTextField(
                  onChanged: (value) {
                    if (isConfirmPasswordEmpty && value.isNotEmpty) {
                      setState(() {
                        isConfirmPasswordEmpty = false;
                      });
                    }
                  },
                  controller: _confirmPasswordController,
                  decoration: BoxDecoration(
                    color: ColorApp.inputColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: ColorApp.greyColor),
                  ),
                  style: TextStyle(color: ColorApp.textInputColor),
                  placeholder: "Confirm Password",
                  obscureText: showConfirmPassword ? false : true,
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
                    icon: showPassword
                        ? Icon(Icons.visibility_off, color: ColorApp.greyColor)
                        : Icon(Icons.visibility, color: ColorApp.greyColor),
                  ),
                  padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8),
                ),
                if (isConfirmPasswordEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: Text(
                      "Confirm Password is required",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 19),
                RichText(
                  text: TextSpan(
                    text: "By clicking the ",
                    style: TextStyle(color: ColorApp.textInputColor),
                    children: [
                      TextSpan(text: "Register", style: TextStyle(color: ColorApp.primaryColor)),
                      WidgetSpan(child: SizedBox(width: 5)),
                      TextSpan(text: "button, you agree\nto the public offer", style: TextStyle(color: ColorApp.textInputColor)),
                    ]
                  ),
                ),
                const SizedBox(height: 38),
            
                GestureDetector(
                  onTap: () {
                    validate();
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorApp.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorApp.greyColor),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Connexion()));
                      },
                      child: Text(
                        "Login",
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
      ),
    );
  }
}
