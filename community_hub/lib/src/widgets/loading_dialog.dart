import 'package:community_hub/lib.dart';

Future showLoadingDialog(context) {
  return showDialog(
    barrierColor: Theme.of(context).primaryColor.withOpacity(0.1),
    barrierDismissible: false,
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Center(child: CircularProgressIndicator()),
    ),
  );
}
