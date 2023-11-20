
import 'package:flutter/material.dart';

class WillPop extends StatelessWidget {
  final Widget child;
  final bool canPop;

  const WillPop({
    Key? key,
    required this.child,
    this.canPop = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: child,
      onWillPop: () async {
        // disable back button when
        //if (Loader.isLoading) return false;
        return canPop;
      },
    );
  }
}
