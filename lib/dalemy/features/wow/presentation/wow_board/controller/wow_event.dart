import 'package:ex_project/app/route/routes.dart';
import 'package:flutter/material.dart';

mixin WowEvent {
  wowPop(BuildContext context) {
    pop(context);
  }

  wowShowSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  wowShowDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  wowShowBottomSheet(BuildContext context, String message) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 200,
        color: Colors.white,
      ),
    );
  }
}