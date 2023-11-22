import 'package:community_hub/lib.dart';
import 'package:community_hub/src/widgets/loading_dialog.dart';


class Loader {
  static void show(BuildContext context) => showLoadingDialog(context);

  static void hide(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();

  static Widget get progressIndicator => const CircularProgressIndicator();
}

