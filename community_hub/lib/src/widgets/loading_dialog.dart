

import 'package:community_hub/lib.dart';

Future showLoadingDialog(context) {
  return showDialog(barrierColor: Theme.of(context).primaryColor.withOpacity(0.1),
    barrierDismissible: false,
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const CircularProgressIndicator(),
    ),
  );
}

/*Future showLoadingDialog(context) {
  return showDialog(
    barrierDismissible: false,
    barrierColor: CustomColors.textColorLight2.withOpacity(0.2),
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Center(
        child: Lottie.asset(
          'assets/gif/loading2.json',
          height: 140.h,
          frameRate: FrameRate.max,
          repeat: true,
          errorBuilder: (context, e, _) => const CircularProgressIndicator(),
        ),
      ),
    ),
  );
}
*/
