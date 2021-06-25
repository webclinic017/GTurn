import 'package:flutter/material.dart';
import 'package:gturn/dialogs/ExitConfirmationDialog.dart';

class DialogHelper {

  static exit(context) => showDialog(context: context, builder: (context) => ExitConfirmationDialog());
}