import 'dart:math';

import 'package:community_hub/lib.dart';
import 'package:community_hub/src/mock/database/services.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';

@RoutePage(name: 'serviceDetails')
class ServiceDetailsScreen extends StatelessWidget {
  final Worker worker;

  const ServiceDetailsScreen({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    Random random = Random();

    return Scaffold(
      appBar: AppBar(
        title: KText(
          'Details',
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            ColSpacing(24.h),
            Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'profileImage${worker.id}',
                      child: SizedBox(
                        width: 110.w,
                        height: 110.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.asset(worker.profilePic!),
                        ),
                      ),
                    ),
                    RowSpacing(16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          worker.name,
                          // color: context.onPrimary,
                          fontWeight: FontWeight.w500, fontSize: 18.sp,
                        ),
                        ColSpacing(2.h),
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
                      ],
                    ),
                  ],
                )
              ],
            ),
            ColSpacing(40.h),
            Container(
              padding: EdgeInsets.all(16.w),
              //height: 400.h,
              decoration: BoxDecoration(
                color: context.background,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                      color: context.outline.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 16)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    'Biography',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: context.primary,
                  ),
                  ColSpacing(8.h),
                  KText(
                    '${worker.name} is a professional '
                    '${worker.type!.name} in Sweden. ${worker.name} charges'
                    ' ${worker.price}/hr and has a rating of ${worker.rating}'
                    '/5.0. We totally recommend!',
                    fontSize: 15.sp,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.h, right: 16.w, left: 16.w),
          child: FilledButton(
              onPressed: () {
                AppNavigator.of(context).push(const BookService());
              },
              child: const Text('Book Now')),
        ),
      ),
    );
  }
}
