import 'package:flutter/material.dart';

class AnimContainer extends StatefulWidget {
  const AnimContainer({Key? key}) : super(key: key);

  @override
  State<AnimContainer> createState() => _AnimContainerState();
}

class _AnimContainerState extends State<AnimContainer> {
  Color color = Colors.pink;
  double borderRadius = 30;
  double height = 100;
  double width = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
            color = Colors.green;
            borderRadius = 200;
            height = 200;
            width = 200;
            });
          },
          child: const Text('Run'),
        ),
      ),
      body: Center(
            child: AnimatedContainer(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
              borderRadius: BorderRadius.circular(borderRadius),
              ), duration: const Duration(seconds: 1),
            ),
      ),
    );
  }
}
