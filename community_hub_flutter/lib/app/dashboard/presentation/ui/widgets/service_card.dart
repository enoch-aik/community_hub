import 'package:community_hub/app/dashboard/data/models/community_service.dart';
import 'package:community_hub/lib.dart';

class ServiceCard extends StatelessWidget {
  final CommunityService service;
  final void Function()? onTap;

  const ServiceCard({super.key, required this.service,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            service.imagePath,
            width: 60.w,
          ),
          ColSpacing(8.h),
          KText(
            service.service,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
