import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final Function? onResult;
  final bool autofocuse;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.autofocuse = false,
    this.onResult,
    this.validator,
    this.controller,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  FocusNode node = FocusNode();

  @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        autofocus: widget.autofocuse,
        readOnly: widget.readOnly,
        validator: (v) {
          return widget.validator?.call(v);
        },
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        keyboardType: TextInputType.emailAddress,
        // style: AppStyle.textSmall,
        decoration: InputDecoration(
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          prefixIcon: Icon(widget.icon),
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 4, color: Colors.black),
            borderRadius: BorderRadius.circular(45),
          ),
        ),
      ),
    );
  }
}
