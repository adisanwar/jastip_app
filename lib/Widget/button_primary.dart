import 'package:flutter/material.dart';
import 'package:jastip_app/Styles/colors.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  // final Color? color;
  final double borderRadius;
  final double padding;
  final double height; // Tambahkan properti height

  const ButtonPrimary({
    Key? key,
    required this.onPressed,
    required this.child,
    // this.color,
    this.borderRadius = 8.0,
    this.padding = 14.0,
    this.height = 48.0, // Default tinggi tombol 48
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Membuat tombol memenuhi lebar layar
      height: height, // Atur tinggi tombol
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: white, // Warna teks tombol
          padding: EdgeInsets.all(padding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: child,
      ),
    );
  }
}
