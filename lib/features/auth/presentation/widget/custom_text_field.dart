// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final IconData prefixIcon;
//   final bool isPassword;
//   final TextEditingController? controller;
//   final VoidCallback? onSuffixTap;

//   const CustomTextField({
//     super.key,
//     required this.hint,
//     required this.prefixIcon,
//     this.isPassword = false,
//     this.controller,
//     this.onSuffixTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 52,
//       decoration: BoxDecoration(
//         color: const Color(0xFF0E3A78),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword,
//         style: const TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(vertical: 14),
//           prefixIcon: Icon(prefixIcon, color: Colors.white70),
//           suffixIcon: isPassword
//               ? GestureDetector(
//                   onTap: onSuffixTap,
//                   child: const Icon(Icons.visibility_off,
//                       color: Colors.white70),
//                 )
//               : null,
//           hintText: hint,
//           hintStyle: const TextStyle(color: Colors.white54),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.prefixIcon,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFF0E3A78),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        cursorColor: Colors.white,
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          prefixIcon: Icon(widget.prefixIcon, color: Colors.white70),

          /// 👁 Eye Toggle
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,

          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}
