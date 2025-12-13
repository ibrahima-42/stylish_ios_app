import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: SvgPicture.asset("assets/images/logo.svg",width: 274,height: 100,),
      ),
    );
  }
}