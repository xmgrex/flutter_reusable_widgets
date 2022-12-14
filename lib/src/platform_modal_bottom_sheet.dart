import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<void> showPlatformModalBottomSheet({
  required BuildContext context,
  required Widget widget,
  Color? barrierColor,
  Duration? duration,
  Curve? animationCurve,
  Curve? previousRouteAnimationCurve,
}) async {
  if (Platform.isIOS || !kIsWeb) {
    await showCupertinoModalBottomSheet<void>(
      expand: true,
      animationCurve: animationCurve,
      barrierColor: barrierColor ?? Colors.black.withOpacity(.8),
      previousRouteAnimationCurve: previousRouteAnimationCurve,
      context: context,
      duration: duration,
      builder: (context) => widget,
    );
  } else {
    await showMaterialModalBottomSheet<void>(
      animationCurve: animationCurve,
      duration: duration,
      context: context,
      builder: (context) => widget,
    );
  }
}

Future<void> showHalfModalBottomSheet({
  required BuildContext context,
  required Widget widget,
  double? height,
  Color? barrierColor,
  Color? contentColor,
}) async {
  await showModalBottomSheet<void>(
    context: context,
    builder: (context) => Container(
        height: height ?? 300,
        decoration: BoxDecoration(
          color: contentColor ?? Colors.grey[200],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        child: widget),
    backgroundColor: barrierColor ?? Colors.black.withOpacity(.8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
  );
}
