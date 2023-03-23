import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? errorText;

  AppError({this.errorText});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != errorText && errorText!.toString().isNotEmpty,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          errorText!,
          style: TextStyle(
            color: Colors.red,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
