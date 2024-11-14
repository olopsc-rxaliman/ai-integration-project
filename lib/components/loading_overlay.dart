import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final String? subtext;

  const LoadingOverlay({
    super.key,
    required this.child,
    this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
      overlayColor: Colors.black.withOpacity(0.6),
      overlayWidgetBuilder: (progress) => Center(
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SpinKitPulsingGrid(
                color: Colors.white,
              ),
              subtext == ''
                  ? const SizedBox()
                  : Text(
                      "\n${subtext!}",
                      style: const TextStyle(color: Colors.white),
                    )
            ],
          ),
        ),
      ),
      child: child,
    );
  }
}
