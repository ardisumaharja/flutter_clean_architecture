import 'dart:async';

import 'package:flutter/material.dart';

class WeatherAnimation extends StatefulWidget {
  const WeatherAnimation({super.key});

  @override
  State<WeatherAnimation> createState() => _WeatherAnimationState();
}

class _WeatherAnimationState extends State<WeatherAnimation> {
  bool isMove = false;

  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 20) {
        timer.cancel();
      }
      if (timer.tick % 5 == 0) {
        setState(() {
          isMove = true;
        });
      } else {
        setState(() {
          isMove = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isMove ? Colors.black.withOpacity(0.7) : Colors.grey,
              offset: const Offset(0, 1),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: isMove
                ? const [
                    Color(0xFF94A9FF),
                    Color(0xFF6B66CC),
                    Color(0xFF200F75),
                  ]
                : const [
                    Color(0xDDFFFA66),
                    Color(0xDDFFA057),
                    Color(0xDD940B99),
                    // Color(0xDDFFFA66),
                  ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              top: 50,
              right: isMove ? 120 : -100,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isMove ? 1 : 0,
                child: Image.asset(
                  'assets/images/storm.png',
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              top: 50,
              left: isMove ? -100 : 130,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isMove ? 0 : 1,
                child: Image.asset(
                  'assets/images/cloudy.png',
                  height: 80,
                  width: 80,
                ),
              ),
            ),
            // AnimatedPositioned(
            //   duration: const Duration(microseconds: 200),
            //   top: 130,
            //   left: isMove ? 100 : -40,
            //   child: AnimatedOpacity(
            //       duration: const Duration(microseconds: 300),
            //       opacity: isMove ? 1 : 0,
            //       child: const Sun()),
            // ),
            // AnimatedPadding(
            //   padding: EdgeInsets.only(
            //     top: isMove ? 200 : 50,
            //   ),
            //   duration: const Duration(microseconds: 200),
            //   child: const Center(
            //     child: Sun(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
