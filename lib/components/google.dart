import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/hooks/color.dart';

class Google extends StatefulWidget {
  const Google({super.key});

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 54,
      decoration: BoxDecoration(
        color: ColorApp.otherlogColor,
        borderRadius: BorderRadius.circular(50),
        border: BoxBorder.all(color: ColorApp.primaryColor)
      ),
      child: Center(
        child: SvgPicture.asset("assets/images/apple.svg"),
      ),
    );
  }
}