



import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

animationFunction(index, child, {duration, delay}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    delay:delay?? Duration(milliseconds: 50),
    duration:duration?? Duration(milliseconds: 500),

    child: SlideAnimation(
      verticalOffset: 50.0,
      child: FadeInAnimation(child: child),
    ),
  );
}