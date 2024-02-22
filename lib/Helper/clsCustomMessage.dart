import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloudapp/Helper/clsDeviceSize.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
class clsCustomMessage {
 static void Message(String value, bool state, BuildContext context) {
   showTopSnackBar(
     Overlay.of(context),
     state==true?
     CustomSnackBar.success(
       message:
      value,
     ): CustomSnackBar.error(
       message:
       value,
     ),
   );
  }
}
