import 'package:community_hub/lib.dart';
import 'package:community_hub/src/router/navigator.dart';
import 'package:community_hub/src/router/router.dart';

class ChooseAccountType extends StatelessWidget {
  const ChooseAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: KText(
              //'Choose the account type you want to create',
              'Create an account as any of the following:',
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          ColSpacing(32.h),
          SizedBox(
              width: double.maxFinite,
              child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    AppNavigator.of(context).push(const ClientSignup());
                  },
                  child: const Text('Continue as a Client'))),
          ColSpacing(4.h),
          SizedBox(
              width: double.maxFinite,
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    AppNavigator.of(context).push(const WorkerSignup());
                  },
                  child: const Text('Continue as a Worker'))),
          ColSpacing(16.h),
        ],
      ),
    );
  }

  static void displayModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      constraints: BoxConstraints.tightFor(
        height: 248.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      builder: (context) => ChooseAccountType(),
    );
  }
}
