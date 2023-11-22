import 'package:community_hub/app/dashboard/data/models/offer.dart';
import 'package:community_hub/lib.dart';

class OfferCard extends StatelessWidget {
  final ServiceOffer offer;

  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158.h,
      width: 289.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          color: offer.color, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KText(
                offer.title,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: context.secondary,
              ),
              RowSpacing(8.w),
              const Icon(
                Icons.info,
                size: 15,
              )
            ],
          ),
          KText(
            offer.discount,
            fontSize: 38.sp,
            color: context.primary,
            fontWeight: FontWeight.w600,
          ),
          ColSpacing(4.h),
          SizedBox(
              height: 30.h,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: context.onPrimary,
                      foregroundColor: context.secondary,
                      side: const BorderSide(color: Colors.transparent)),
                  onPressed: () {},
                  child: const Text('Grab Offer')))
        ],
      ),
    );
  }
}
