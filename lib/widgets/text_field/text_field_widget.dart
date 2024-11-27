// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.lableStyle,
    this.hintText,
    this.obscureText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.inputFormater,
    this.title,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.readOnly,
    this.onSaved,
    this.label,
    this.autofocus,
    this.fontWeight,
    this.onChanged,
    this.FocusNode,
    this.onTap,
    this.maxLines,
    this.from,
  }) : super(key: key);
  final labelText;
  final prefixIcon;
  final suffixIcon;
  final lableStyle;
  final maxLines;
  final hintText;
  final FocusNode;

  final obscureText;
  final controller;

  final validator;
  final keyboardType;
  final inputFormater;
  final onChanged;
  final title;
  final inputFormatters;
  final onFieldSubmitted;
  final readOnly;
  final onSaved;

  final label;
  final autofocus;
  final fontWeight;
  final onTap;
  final from;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: from == "search"
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: TextFormField(
        onTap: onTap,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        controller: controller,
        onChanged: onChanged,
        cursorWidth: 1.0,
        focusNode: FocusNode,
        readOnly: readOnly ?? false,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        minLines: 1,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: black,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,

          labelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: from == "FF" || from == "search"
                ? black.withOpacity(0.6)
                : secondaryTextColor,
          ),
          hintText: hintText,

          hintStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: from == "FF" || from == "search"
                ? black.withOpacity(0.6)
                : secondaryTextColor,
          ),
          contentPadding:
              EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: from == "FF" || from == "search"
                    ? Colors.grey.withOpacity(0.6)
                    : from == "Fi" || from == "search"
                        ? Colors.grey.withOpacity(0.3)
                        : primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: primaryColor),
          ),

          floatingLabelBehavior: FloatingLabelBehavior.auto,
          isDense: false,

          // border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2({
    Key? key,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.lableStyle,
    this.hintText,
    this.obscureText,
    this.controller,
    this.keyboardType,
    this.title,
    this.onFieldSubmitted,
    this.readOnly,
    this.label,
    this.autofocus,
    this.fontWeight,
    this.onChanged,
    this.FocusNode,
    this.maxLines,
    this.from,
  }) : super(key: key);
  final labelText;
  final prefixIcon;
  final suffixIcon;
  final lableStyle;
  final maxLines;
  final hintText;
  final FocusNode;

  final obscureText;
  final controller;

  final keyboardType;
  final onChanged;
  final title;
  final onFieldSubmitted;
  final readOnly;

  final label;
  final autofocus;
  final fontWeight;
  final from;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        // height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: grey.withOpacity(0.1),
        ),

        child: TextFormField(
          keyboardType: keyboardType,
          // controller: controller,
          // onChanged: onChanged,
          cursorWidth: 1.0,
          // focusNode: FocusNode,
          readOnly: false,
          // onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          minLines: 1,

          maxLines: maxLines,
          style: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: black,
          ),
          decoration: InputDecoration(
            // labelText: "Title",
            suffixIcon: suffixIcon,
            labelStyle: GoogleFonts.workSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: secondaryTextColor.withOpacity(0.5),
            ),
            hintText: hintText,

            hintStyle: GoogleFonts.workSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: secondaryTextColor.withOpacity(0.5),
            ),
            contentPadding:
                EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor.withOpacity(0.5)),
            ),

            floatingLabelBehavior: FloatingLabelBehavior.auto,
            isDense: false,
          ),
        ),
      ),
    );
  }
}
