import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final String? imageIcon;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.label,
    this.imageIcon,
    this.backgroundColor,
    this.labelColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          print("Botão Login clicado!");
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(color: borderColor ?? Colors.transparent)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (imageIcon != null)
              Image.asset(
                imageIcon!,
                height: 26,
                width: 26,
                fit: BoxFit.contain,
              )
            else
              const SizedBox(width: 0),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: labelColor ?? Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
