import 'package:flutter/material.dart';

class AnimationOpacity extends StatefulWidget {
  const AnimationOpacity({Key? key}) : super(key: key);

  @override
  State<AnimationOpacity> createState() => _AnimationOpacityState();
}

class _AnimationOpacityState extends State<AnimationOpacity> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if(opacity == 0){
                opacity = 1;
              }else{
                opacity = 0;
              }
            });
          },
          child: const Text('Run'),
        ),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: opacity,
          child: Container(
            color: Colors.blue,
            width: 100,
            height: 100,
          ),
        )
      ),
    );
  }
}

