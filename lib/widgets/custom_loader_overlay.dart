import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CustomLoaderOverlay extends StatelessWidget {
  const CustomLoaderOverlay({
    required this.child,
    Key? key,
    this.opacity,
  }) : super(key: key);

  final Widget child;
  final double? opacity;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitDoubleBounce(
          color: Colors.greenAccent,
          size: 50.0,
        ),
        // overlayWidget: Center(
        //   child: Padding(
        //     padding:
        //         EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        //     child: const CustomLoadingIndicator(),
        //   ),
      ),
      overlayOpacity: opacity ?? 1,
      overlayColor: Colors.white.withOpacity(0.5),
      child: child,
    );
  }
}

// class CustomLoadingIndicator extends StatelessWidget {
//   const CustomLoadingIndicator({
//     Key? key,
//     this.size = 50.0,
//   }) : super(key: key);
//
//   final double size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(Assets.loadingGif);
//   }
// }
