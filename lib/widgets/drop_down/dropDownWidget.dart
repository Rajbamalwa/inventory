import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/colors.dart';

class CustomDropdownField extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final prefixIcon;
  final onChanged;
  final value;
  final validator;
  final Hint;

  CustomDropdownField({
    Key? key,
    required this.labelText,
    required this.items,
    this.prefixIcon,
    this.onChanged,
    this.value,
    this.validator,
    this.Hint,
  }) : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: false,
      value: widget.value != '' ? widget.value : null,
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.start,
        contentPadding: EdgeInsets.fromLTRB(28, 20, 12, 12),
        // labelText: widget.labelText,
        labelStyle: GoogleFonts.workSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: secondaryTextColor,
        ),
        prefixIcon: widget.prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: transparent),
        ),
      ),
      hint: Text(
        widget.Hint,
        style: GoogleFonts.workSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: secondaryTextColor,
        ),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: GoogleFonts.workSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSaved: (value) {
        selectedValue = value.toString();
      },
    );
  }

  InputDecoration buildInputDecoration(
    String labelText,
    prefixIcon,
  ) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: prefixIcon,
      labelStyle: GoogleFonts.workSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: secondaryTextColor,
      ),
      fillColor: white,
      filled: true,
    );
  }
}
