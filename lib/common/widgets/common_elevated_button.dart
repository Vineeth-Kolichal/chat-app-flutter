import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.widthFactor = 1.0,
  });
  final VoidCallback onPressed;
  final String label;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * widthFactor,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
