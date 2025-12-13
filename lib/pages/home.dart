import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/components/feature.dart';
import 'package:stylish/hooks/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: ColorApp.fondPage,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          sizeStyle: CupertinoButtonSize.small,
          borderRadius: BorderRadius.circular(90),
          color: ColorApp.inputColor,
          child: Icon(Icons.menu, size: 24, color: Colors.black),
          onPressed: () {},
        ),
        trailing: GestureDetector(
          onTap: () {
            //navigate to page profile
            print("profile");
          },
          child: Image.asset(
            "assets/images/profile.png",
            width: 40,
            height: 40,
          ),
        ),
        middle: SvgPicture.asset("assets/images/logohome.svg"),
      ),
      child: SafeArea(
        child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            CupertinoTextField(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ]
            ),
            prefix: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SvgPicture.asset("assets/images/search.svg",width: 24,height: 24,),
            ),
            suffix: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SvgPicture.asset("assets/images/micro.svg",width: 24,height: 24,),
            ),
             placeholder: "Search any Product..", 
            ),
            const SizedBox(height: 17,),
            Feature(),
          ],
        ),
        ),
      ),
    );
  }
}
