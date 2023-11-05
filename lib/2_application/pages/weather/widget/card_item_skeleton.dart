import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CardItemSkeleton extends StatelessWidget {
  const CardItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonLine(
              style: SkeletonLineStyle(
                height: 60,
                width: 60,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 10,
                    width: 150,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 10),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 10,
                    width: 50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 10),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 10,
                    width: 100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
