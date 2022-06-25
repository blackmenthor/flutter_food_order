import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 48.0,
            width: 48.0,
            child: CircularProgressIndicator(),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'Loading data, please wait...',
          ),
        ],
      ),
    );
  }
}
