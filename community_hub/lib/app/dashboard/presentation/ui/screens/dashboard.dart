import 'package:community_hub/app/dashboard/data/models/community_service.dart';
import 'package:community_hub/app/dashboard/data/models/offer.dart';
import 'package:community_hub/app/dashboard/presentation/ui/widgets/category_header.dart';
import 'package:community_hub/app/dashboard/presentation/ui/widgets/cleaning_service_card.dart';
import 'package:community_hub/app/dashboard/presentation/ui/widgets/offer_card.dart';
import 'package:community_hub/app/dashboard/presentation/ui/widgets/search_textfield.dart';
import 'package:community_hub/app/dashboard/presentation/ui/widgets/service_card.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/res/assets/assets.dart';

@RoutePage(name: 'dashboard')
class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            KText(
              'HELLO ENOCH! 👋',
              fontWeight: FontWeight.w500,
              color: context.outline,
            ),
            ColSpacing(8.h),
            KText(
              'What are you looking for today?',
              fontSize: 26.sp,
              color: context.primary,
              fontWeight: FontWeight.w500,
            ),
            ColSpacing(16.h),
            ServiceSearchTextField(controller: searchController),
            ColSpacing(24.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(3, (index) => index).map(
                    (e) => Padding(
                      padding: EdgeInsets.only(right: 28.w),
                      child: ServiceCard(
                        service: CommunityService.services[e],
                        onTap: () {},
                      ),
                    ),
                  ),
                  ServiceCard(
                    service: CommunityService.seeAll,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const CategoryHeader(header: 'Cleaning Services'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(4, (index) => index).map(
                    (e) => Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: CleaningServiceCard(
                        service: CommunityService.cleaningServices[e],
                        //onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ColSpacing(16.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    2,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: OfferCard(offer: ServiceOffer.offers[index]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const CategoryHeader(
                header: 'Appliance Repair',
                showActionButton: false,
              ),
            ),
            Image.asset(
              AppAssets.applianceRepairOfferImg,
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
              filterQuality: FilterQuality.high,
            ),
            ColSpacing(24.h),
          ],
        ),
      ),
    );
  }
}
