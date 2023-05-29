import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class AccountStatesSkeleton extends StatelessWidget {
  const AccountStatesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: double.infinity,
            height: 60,
            borderRadius: BorderRadius.circular(8)
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: double.infinity,
            height: 60,
            borderRadius: BorderRadius.circular(8)
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: double.infinity,
            height: 55,
            borderRadius: BorderRadius.circular(4)
          ),
        ),
      ],
    );
  }
}