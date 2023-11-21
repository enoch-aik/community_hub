import 'dart:math';

import 'package:community_hub/lib.dart';
import 'package:community_hub/src/mock/database/services.dart';

class ServiceListCard extends StatelessWidget {
  final Worker worker;
  final void Function()? onTap;

  const ServiceListCard({super.key, required this.worker, this.onTap});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 110.w,
            height: 110.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    worker.profilePic!,
                  )),
            ),
          ),
          RowSpacing(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KText(
                worker.name,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  RowSpacing(4.w),
                  KText(
                    worker.rating.toString(),
                    // color: context.outline,
                    fontWeight: FontWeight.w500,
                  ),
                  RowSpacing(4.w),
                  KText(
                    '(${random.nextInt(200)})',
                    color: context.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              KText(
                'Starts From',
                color: context.secondary,
                fontSize: 15.sp,
              ),
              Container(
                width: 40.w,
                height: 24.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: context.primary,
                    borderRadius: BorderRadius.circular(6.r)),
                child: KText(
                  '\$${worker.price}',
                  fontSize: 14.sp,
                  color: context.onPrimary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
