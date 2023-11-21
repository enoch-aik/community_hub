import 'package:community_hub/app/dashboard/presentation/ui/widgets/worker_card.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/src/mock/database/services.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';

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
          itemBuilder: (context, index) => WorkerCard(
                worker: workers[index],
                onTap: () {
                  AppNavigator.of(context)
                      .push(ServiceDetails(worker: workers[index]));
                },
              ),
          separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Divider(
                  height: 0,
                ),
              ),
          itemCount: workers.length)

      ,
    );
  }
}
