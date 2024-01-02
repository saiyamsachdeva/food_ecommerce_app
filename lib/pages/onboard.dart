import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/pages/signup.dart';
import 'package:food_ecommerce_app/widget/content_model.dart';
import 'package:food_ecommerce_app/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentindex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 350,
                          width: MediaQuery.of(context).size.width / 1.2,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          contents[i].title,
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          contents[i].description,
                          style: AppWidget.LightTextFieldStyle(),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => builtDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentindex == contents.length - 1) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              }
              _controller.nextPage(
                duration: Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20),),
              height: 50,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentindex == contents.length - 1 ? "Start" : "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container builtDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentindex == index ? 18 : 7,
      margin: EdgeInsets.only(
        right: 5.0,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black38),
    );
  }
}
