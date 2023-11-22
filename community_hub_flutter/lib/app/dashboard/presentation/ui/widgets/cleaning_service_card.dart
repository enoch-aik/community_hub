import 'package:community_hub/app/dashboard/data/models/community_service.dart';
import 'package:community_hub/lib.dart';

class CleaningServiceCard extends StatelessWidget {
  final CommunityService service;
  final void Function()? onTap;

  const CleaningServiceCard({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          service.imagePath,
          filterQuality: FilterQuality.high,
        ),
        ColSpacing(12.h),
        KText(
          service.service,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
