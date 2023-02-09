import 'package:flutter/material.dart';

class TweenAnim extends StatefulWidget {
  const TweenAnim({Key? key}) : super(key: key);

  @override
  State<TweenAnim> createState() => _TweenAnimState();
}

class _TweenAnimState extends State<TweenAnim> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation<double> _rotateAnim = Tween<double>(begin: 0.0, end: 10.0).animate(_animationController);
  late final Animation<double> _opacityAnim = Tween<double>(begin: 0.2, end: 1.0).animate(_animationController);
  late final Animation<double> _containerAnim = Tween<double>(begin: 10, end: 200).animate(_animationController);
  late final Animation<Color?> _colorAnim = ColorTween(begin: Colors.pink , end: Colors.blue).animate(_animationController);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Transform.rotate(
            angle: _rotateAnim.value ,
            child: Opacity(
            opacity: _opacityAnim.value,
            child: Container(
              width: _containerAnim.value,
              height: _containerAnim.value,
              decoration: BoxDecoration(
                color: _colorAnim.value,
              ),
            ),
          ),),
        ),
      ),
    );
  }
}
