import 'package:flutter/cupertino.dart';
import 'package:post_crud/ui/users/widgets/user_avatar_loading.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class UserLoadingSkeleton extends StatelessWidget {
  const UserLoadingSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const UserAvatarLoading(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SkeletonText(height: 12),
              SizedBox(
                height: 12,
              ),
              SkeletonText(height: 12),
            ],
          ),
        )
      ],
    );
  }
}
