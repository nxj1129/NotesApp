import 'package:flutter/material.dart';
import 'package:testproject/utilities/dialogs/generic_dialog.dart';

Future<void> showCannotShareEmptySnoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Sharing',
    content: 'You cannot share an empty note!',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
