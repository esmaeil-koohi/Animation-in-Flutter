import 'package:flutter/material.dart';

class AnimPosition extends StatefulWidget {
  const AnimPosition({Key? key}) : super(key: key);

  @override
  State<AnimPosition> createState() => _AnimPositionState();
}

class _AnimPositionState extends State<AnimPosition> {
  double position = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
            position = 400;
            });
          },
          child: const Text('Run'),
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.white,),
          AnimatedPositioned(
            left: 140,
            bottom: position,
              duration: const Duration(seconds: 4),
              child: Image.asset('assets/images/space_ship.jpg',
                fit: BoxFit.cover, width: 150, height: 150,)
          )
        ],
      )
    );
  }
}
