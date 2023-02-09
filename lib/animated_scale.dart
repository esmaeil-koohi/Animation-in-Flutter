import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimScale extends StatefulWidget {
  const AnimScale({Key? key}) : super(key: key);

  @override
  State<AnimScale> createState() => _AnimScaleState();
}

class _AnimScaleState extends State<AnimScale> {
  double scale = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                scale += 1;
              });
            },
            child: const Text('Run'),
          ),
        ),
        body: Center(
          child: AnimatedScale(
            duration:const Duration(seconds: 2),
            scale: scale,
            curve:Curves.bounceIn,
            child: const Icon(CupertinoIcons.heart_fill, color: Colors.red, size: 50,),
          ),
        )
    );
  }
}
