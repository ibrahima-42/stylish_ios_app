import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Feature extends StatefulWidget {
  const Feature({super.key});

  @override
  State<Feature> createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("All Featured",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        ),
        Spacer(),
        //sort
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurStyle: BlurStyle.normal,
                offset: Offset(0, 2),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Sort"),
                SvgPicture.asset("assets/images/sort.svg",width: 24,height: 24,),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12,),
        //filter
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurStyle: BlurStyle.normal,
                offset: Offset(0, 2),
              )
            ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Filter"),
                SvgPicture.asset("assets/images/filter.svg",width: 24,height: 24,)
              ],
            ),
          ),
        ),

      ],
    );
  }
}