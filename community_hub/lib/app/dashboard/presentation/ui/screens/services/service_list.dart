import 'package:community_hub/app/dashboard/presentation/ui/widgets/service_list_card.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/mock/database/services.dart';

@RoutePage(name: 'serviceList')
class ServiceListScreen extends StatelessWidget {
  final List<Worker> workers;
  final String title;

  const ServiceListScreen(
      {super.key, required this.workers, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          title,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          itemBuilder: (context, index) => ServiceListCard(
                worker: workers[index],
                onTap: () {},
              ),
          separatorBuilder: (context, index) => ColSpacing(8.h),
          itemCount: workers.length)

      /*ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          ...List.generate(workers.length,
              (index) => ServiceListCard(worker: workers[index]))
        ],
      )*/
      ,
    );
  }
}
