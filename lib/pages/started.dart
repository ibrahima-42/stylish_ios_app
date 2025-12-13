import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stylish/hooks/color.dart';
import 'package:stylish/pages/home.dart';

class Started extends StatefulWidget {
  const Started({super.key});

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  @override
  Widget build(BuildContext context) {
    //AnnotatedRegion pour le status bar personnalisé la couleur 
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: CupertinoPageScaffold(
        child: Stack(
          fit: StackFit.expand,
          children: [
            //Image de Fond
            Image.asset("assets/images/start.png", fit: BoxFit.cover),
      
            //deco pour le gradient 
            Container (
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:[
                    Colors.transparent,
                    Colors.black,
                  ])
              ) ,
            ),
      
            //Contenue
            SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.all(16.0),
                child: Column(
                  children: [
                    Spacer(),
                    Text("You want \nAuthentic, here\nyou go!", style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 14),
                    Text("Find it here, buy it now!",style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 44),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
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
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),),
    );
  }
}