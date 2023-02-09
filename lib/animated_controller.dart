import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimController extends StatefulWidget {
  const AnimController({Key? key}) : super(key: key);

  @override
  State<AnimController> createState() => _AnimControllerState();
}

class _AnimControllerState extends State<AnimController> with SingleTickerProviderStateMixin {

late AnimationController _animatedController;
bool isLike = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animatedController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    // _animatedController.repeat();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Column(
            children: [
              Row(
                children: [
                 const SizedBox(width: 10,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.asset('assets/images/profile.jpg', width: 26, height: 26, fit: BoxFit.cover,),
                  ),
                  const SizedBox(width: 10,),
                  const Text('esi_koohi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  const Expanded(child: SizedBox()),
                  const Icon(Icons.more_vert,),
                  const SizedBox(width: 10,),
                ],
              ),
              const SizedBox(height: 15,),
              Image.asset('assets/images/profile.jpg',
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                 fit: BoxFit.cover,),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8,2,0,0),
                child: Row(
                  children: [
                    AnimatedBuilder(
                      animation: CurvedAnimation(curve: Curves.bounceInOut, parent: _animatedController),
                      builder: (context, child) {
                      return IconButton(onPressed: () {
                        if(isLike){
                          isLike = false;
                          _animatedController.reverse();
                        }else{
                          isLike = true;
                          if(!_animatedController.isCompleted){
                            _animatedController.forward();
                          }
                        }
                      },
                          icon:isLike?  Opacity(
                            opacity:_animatedController.value != _animatedController.lowerBound ? _animatedController.value :1,
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                              size:_animatedController.value != _animatedController.lowerBound?
                              24 * _animatedController.value :
                              24,),
                          ):Opacity(
                            opacity:_animatedController.value != _animatedController.lowerBound ? _animatedController.value :1,
                            child: Icon(
                              CupertinoIcons.heart,
                              color: Colors.black,
                              size:_animatedController.value != _animatedController.lowerBound?
                              24 * _animatedController.value :
                              24,),
                          )

                      );
                    },  ),
                    const SizedBox(width: 15,),
                    const Icon(Icons.messenger_outline_outlined, size: 24,),
                    const SizedBox(width: 15,),
                    const Icon(CupertinoIcons.location_fill, size: 24,),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}




