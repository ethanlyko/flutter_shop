import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../common/app_style.dart';

Future<bool?> customConfirmDialog({
  required BuildContext context,
  required String content,
  String title = "",
  bool infoOnly = false,
  bool barrierDismissible = true,
}) {
  return showDialog<bool>(
      barrierDismissible: barrierDismissible,
      barrierColor: const Color.fromARGB(110, 0, 0, 0),
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsOverflowButtonSpacing: 0.1,
          backgroundColor: AppStyle.dialogBackgroundColor,
          surfaceTintColor: Colors.white,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyle.textMedium,
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
            style: AppStyle.textSmaller,
          ),
          actions: [
            (infoOnly)
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      S.of(context).common_cancel,
                      style: AppStyle.textSmaller,
                    ),
                  ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: (infoOnly)
                  ? null
                  : ElevatedButton.styleFrom(
                      backgroundColor: AppStyle.yellowColor,
                    ),
              child: Text(
                (infoOnly)
                    ? S.of(context).common_got_it
                    : S.of(context).common_yes,
                style: AppStyle.textSmallerBlack,
              ),
            )
          ],
        );
      });
}
