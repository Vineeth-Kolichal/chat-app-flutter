import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.widthFactor = 1.0,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final String label;
  final double widthFactor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * widthFactor,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white, size: 30)
            : Text(
                label,
                style:
                    theme.textTheme.labelLarge?.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
