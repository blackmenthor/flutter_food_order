import 'package:flutter/material.dart';
import 'package:flutter_food_order/ui/utils/extensions.dart';

class PromptDialog extends StatelessWidget {
  const PromptDialog({
    Key? key,
    required this.title,
    required this.msg,
    this.positiveMsg = 'Yes',
    this.negativeMsg = 'No'
  }) : super(key: key);

  final String title;
  final String msg;
  final String positiveMsg;
  final String negativeMsg;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 8.0,),
          Text(
            msg,
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 24.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: MaterialButton(
                    child: Text(
                      positiveMsg,
                      style: context.textTheme.button?.primary?.copyWith(
                        fontSize: 14.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                ),
              ),
              const SizedBox(width: 16.0,),
              Expanded(
                child: MaterialButton(
                  child: Text(
                    negativeMsg,
                    style: context.textTheme.button?.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
