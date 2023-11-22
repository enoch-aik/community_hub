import 'package:community_hub/app/dashboard/data/models/community_service.dart';
import 'package:community_hub/app/dashboard/presentation/ui/widgets/service_card.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/mock/database/services.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';

@RoutePage(name: 'allCategories')
class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const KText(
          'All categories',
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ColSpacing(40.h),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              //mainAxisSpacing: 16.h,
              children: [
                ...CommunityService.services
                    .asMap()
                    .entries
                    .map((e) => ServiceCard(
                          service: e.value,
                          onTap: () async {
                            switch (e.value.type) {
                              case CommunityServiceType.ac:
                                AppNavigator.of(context).push(const AcRepairServiceList());
                              case CommunityServiceType.beauty:
                                AppNavigator.of(context).push(ServiceList(
                                    workers: LocalDatabase.beauty,
                                    title: 'Beauty'));
                              case CommunityServiceType.appliance:
                                AppNavigator.of(context).push(ServiceList(
                                    workers: LocalDatabase.appliance,
                                    title: 'Appliance'));
                              case CommunityServiceType.painting:
                                AppNavigator.of(context).push(ServiceList(
                                    workers: LocalDatabase.painting,
                                    title: 'Painting'));
                              case CommunityServiceType.cleaning:
                                AppNavigator.of(context).push(ServiceList(
                                    workers: LocalDatabase.cleaning,
                                    title: 'Cleaning'));
                              case CommunityServiceType.plumbing:
                                AppNavigator.of(context).push(ServiceList(
                                    workers: LocalDatabase.plumbing,
                                    title: 'Plumbing'));
                              case CommunityServiceType.electronics:
                                AppNavigator.of(context).push(ServiceList(
                                    workers: LocalDatabase.electronics,
                                    title: 'Electronics'));
                              case CommunityServiceType.logistics:
                                AppNavigator.of(context).push(ServiceList(
                                    workers: LocalDatabase.logistics,
                                    title: 'Logistics'));
                              case CommunityServiceType.salon:
                                AppNavigator.of(context).push(ServiceList(
                                    workers: LocalDatabase.salon,
                                    title: 'Salon'));
                              case CommunityServiceType.none:
                                break;
                              case null:
                                break;
                            }
                          },
                        ))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
