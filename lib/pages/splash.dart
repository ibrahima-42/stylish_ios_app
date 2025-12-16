import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/hooks/color.dart';
import 'package:stylish/pages/connexion.dart';
import 'package:stylish/pages/home.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      "title": "Choose Products",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      "image": "assets/images/splash.png",
    },
    {
      "title": "Make Payment",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      "image": "assets/images/splash2.png",
    },
    {
      "title": "Get Your Order",
      "description":
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
      "image": "assets/images/splash3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text((_pageIndex + 1).toString(),style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        Text("/${_pages.length}",style: TextStyle(color: ColorApp.greyColor),)
                      ],
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Connexion()));
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: ColorApp.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return Padding(
                      padding: EdgeInsetsGeometry.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            page["image"],
                            errorBuilder: (context, error, stackTrace) {
                              return const Text("Image non trouver !");
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            page["title"],
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              page["description"],
                              textAlign: TextAlign.center,
                              style: TextStyle(color: CupertinoColors.systemGrey),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _pageIndex >= 1
                        ? GestureDetector(
                          onTap: () {
                            if (_pageIndex > 0 ) {
                              _pageController.animateToPage(
                                _pageIndex - 1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                            }
                          },
                          child: Text(
                              "Prev",
                              style: TextStyle(
                                color: ColorApp.greyColor,
                                fontSize: 18,
                              ),
                            ),
                        )
                        : Container(),
                    Spacer(),
                    ...List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _pageIndex == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _pageIndex == index
                              ? ColorApp.primaryColor
                              : CupertinoColors.inactiveGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child:
                      _pageIndex == 2 ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: ColorApp.primaryColor,
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ):GestureDetector(
                        onTap: () {
                          if(_pageIndex < _pages.length - 1) {
                            _pageController.animateToPage(
                              _pageIndex + 1,
                              duration: Duration(milliseconds: 300),
                               curve: Curves.easeIn);
                          }
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: ColorApp.primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
