import 'package:community_hub/src/res/assets/assets.dart';

class CommunityService {
  final String service;
  final String imagePath;

  CommunityService({required this.service, required this.imagePath});

  static List<CommunityService> get services => [
        CommunityService(service: 'AC Repair', imagePath: AppAssets.acRepair),
        CommunityService(service: 'Beauty', imagePath: AppAssets.beauty),
        CommunityService(service: 'Appliance', imagePath: AppAssets.appliance),
        // CommunityService(service: 'Laundry', imagePath: AppAssets.laundry),
        CommunityService(service: 'Cleaning', imagePath: AppAssets.cleaning),
        CommunityService(service: 'Plumbing', imagePath: AppAssets.plumbing),
        CommunityService(service: 'Logistics', imagePath: AppAssets.logistics),
        CommunityService(service: 'Painting', imagePath: AppAssets.painting),
        CommunityService(
            service: 'Electronics', imagePath: AppAssets.electronics),
      ];

  static CommunityService seeAll =
      CommunityService(service: 'See All', imagePath: AppAssets.seeAllSvg);

  static List<CommunityService> get cleaningServices => [
        CommunityService(
            service: 'Home Cleaning', imagePath: AppAssets.homeCleaningImg),
        CommunityService(
            service: 'Carpet Cleaning', imagePath: AppAssets.carpetCleaningImg),
        CommunityService(
            service: 'Wall Cleaning', imagePath: AppAssets.carpetCleaningImg),
        CommunityService(
            service: 'Home Cleaning', imagePath: AppAssets.homeCleaningImg),
      ];
}
