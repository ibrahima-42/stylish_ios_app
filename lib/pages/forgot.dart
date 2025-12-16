import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/hooks/color.dart';


class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final TextEditingController _passwordController = TextEditingController();

  bool isUserEmpty = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot\npassword?",
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
                controller: _passwordController,
                decoration: BoxDecoration(
                  color: ColorApp.inputColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: ColorApp.greyColor),
                ),
                style: TextStyle(color: ColorApp.textInputColor),
                placeholder: "Enter your email address",
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 4),
                  child: SvgPicture.asset("assets/images/User.svg"),
                ),
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8),
              ),
              const SizedBox(height: 19),
              RichText(
                text: TextSpan(
                  text: '*',
                  style: TextStyle(color: ColorApp.primaryColor),
                  children: [
                    WidgetSpan(child:SizedBox(height: 5,)),
                    TextSpan(text:"We will send you a message to set or reset\nyour new password", style: TextStyle(color: ColorApp.textInputColor))
                  ]
                ),
              ),
              const SizedBox(height: 26),
              GestureDetector(
                  onTap: () {
                    // validate();
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorApp.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: ColorApp.greyColor),
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
          ]),
        ),
      ),
    );
  }
}
