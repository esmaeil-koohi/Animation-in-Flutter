import 'package:flutter/material.dart';

class AnimRotation extends StatefulWidget {
  const AnimRotation({Key? key}) : super(key: key);

  @override
  State<AnimRotation> createState() => _AnimRotationState();
}

class _AnimRotationState extends State<AnimRotation> {
 double terns = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(24),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
             terns += 1;
              });
            },
            child: const Text('Run'),
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(color: Colors.white,),
            AnimatedRotation(
                turns: terns,
                duration: const Duration(seconds: 1),
              child: Image.asset('assets/images/space_ship.jpg',
                fit: BoxFit.cover, width: 150, height: 150,),
            )
          ],
        )
    );
  }
}
