import 'package:community_hub/src/res/assets/assets.dart';
import 'package:equatable/equatable.dart';

class CommunityService extends Equatable {
  final String service;
  final String imagePath;
  final CommunityServiceType? type;

  CommunityService(
      {required this.service, required this.imagePath, required this.type});

  static CommunityService getService(String title) =>
      services.where((element) => element.service == title).first;

  static List<CommunityService> get services => [
        CommunityService(
            service: 'AC Repair',
            imagePath: AppAssets.acRepair,
            type: CommunityServiceType.ac),
        CommunityService(
            service: 'Beauty',
            imagePath: AppAssets.beauty,
            type: CommunityServiceType.beauty),
        CommunityService(
            service: 'Appliance',
            imagePath: AppAssets.appliance,
            type: CommunityServiceType.appliance),
        CommunityService(
            service: 'Painting',
            imagePath: AppAssets.painting,
            type: CommunityServiceType.painting),
        CommunityService(
            service: 'Cleaning',
            imagePath: AppAssets.cleaning,
            type: CommunityServiceType.cleaning),
        CommunityService(
            service: 'Plumbing',
            imagePath: AppAssets.plumbing,
            type: CommunityServiceType.plumbing),
        CommunityService(
            service: 'Electronics',
            imagePath: AppAssets.electronics,
            type: CommunityServiceType.electronics),
        CommunityService(
            service: 'Logistics',
            imagePath: AppAssets.logistics,
            type: CommunityServiceType.logistics),
        CommunityService(
            service: 'Salon',
            imagePath: AppAssets.salon,
            type: CommunityServiceType.salon),
      ];

  static CommunityService seeAll = CommunityService(
      service: 'See All',
      imagePath: AppAssets.seeAllSvg,
      type: CommunityServiceType.none);

  static List<CommunityService> get cleaningServices => [
        CommunityService(
            service: 'Home Cleaning',
            imagePath: AppAssets.homeCleaningImg,
            type: CommunityServiceType.cleaning),
        CommunityService(
            service: 'Carpet Cleaning',
            imagePath: AppAssets.carpetCleaningImg,
            type: CommunityServiceType.cleaning),
        CommunityService(
            service: 'Wall Cleaning',
            imagePath: AppAssets.carpetCleaningImg,
            type: CommunityServiceType.cleaning),
        CommunityService(
            service: 'Home Cleaning',
            imagePath: AppAssets.homeCleaningImg,
            type: CommunityServiceType.cleaning),
      ];

  @override
  List<Object?> get props => [service, imagePath, type];
}

enum CommunityServiceType {
  ac,
  beauty,
  appliance,
  painting,
  cleaning,
  plumbing,
  electronics,
  logistics,
  salon,
  none
}
