import 'package:flutter/cupertino.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class UserAvatarLoading extends StatelessWidget {
  const UserAvatarLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const SkeletonText(height: 48),
    );
  }
}
