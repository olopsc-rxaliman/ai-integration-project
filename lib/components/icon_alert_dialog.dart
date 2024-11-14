import 'package:flutter/material.dart';

class IconAlertDialog extends StatelessWidget {
  final IconData icon;
  final String message;
  final String confirmText;
  final String? actionText;
  final Function()? onActionButtonPressed;
  final bool exitable;

  const IconAlertDialog({
    super.key,
    required this.icon,
    required this.message,
    required this.confirmText,
    this.actionText,
    this.onActionButtonPressed,
    this.exitable = true,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 8,
      ),
      actionsPadding: const EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
        bottom: 10,
      ),
      content: IntrinsicHeight(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFF1f70b1),
            size: 80,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      )),
      actions: [
        actionText != null
            ? TextButton(
                onPressed: () {
                  onActionButtonPressed!();
                },
                child: Text(
                  actionText!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF1f70b1),
                  ),
                ),
              )
            : const SizedBox(),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            confirmText,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF1f70b1),
            ),
          ),
        ),
      ],
    );
  }
}
