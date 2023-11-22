import 'package:community_hub/app/dashboard/presentation/ui/widgets/worker_card.dart';
import 'package:community_hub/app/dashboard/providers.dart';
import 'package:community_hub/lib.dart';
import 'package:community_hub/app/auth/data/models/worker.dart';
import 'package:community_hub/src/mock/database/services.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';

@RoutePage(name: 'acRepairServiceList')
class AcRepairServiceListScreen extends HookConsumerWidget {
  const AcRepairServiceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final acRepairList = ref.watch(acRepairListStreamProvider);
    List<Worker> initialList = [];
    return Scaffold(
        appBar: AppBar(
          title: const KText(
            'AC Repair',
            fontWeight: FontWeight.w500,
          ),
        ),
        body: acRepairList.when(
          data: (data) {
            initialList = data;
            if (initialList.isEmpty) {
              return SizedBox(
                height: 300.h,
                child: const Center(
                  child: KText(
                    'No workers found, please check in later',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: initialList.length,
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Divider(
                  height: 0,
                ),
              ),
              itemBuilder: (context, index) {
                LocalDbWorker worker = initialList[index].toLocalWorkerDb();
                return WorkerCard(
                  worker: worker,
                  onTap: () {
                    AppNavigator.of(context)
                        .push(ServiceDetails(worker: worker));
                  },
                );
              },
            );
          },
          error: (e, _) {
            return SizedBox(
              child: Text(e.toString()),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        )

        /*ListView.separated(
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
          itemCount: workers.length)*/

        );
  }
}
