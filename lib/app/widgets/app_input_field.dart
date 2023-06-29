import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:Quickloc8app_attack_mobile_app/configurations/configurations.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.validator,
    this.onSaved,
    this.onChange,
    this.controller,
    this.obscureText = false,
    this.required = true,
    this.hasBorder = true,
    this.isDisabled = false,
  });
  final String label;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChange;
  final TextEditingController? controller;
  final bool obscureText;
  final bool required;
  final bool? hasBorder;
  final bool? isDisabled;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = false;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        if (widget.inputType == TextInputType.phone)
          IntlPhoneField(
            initialCountryCode: 'ZA',
            controller: widget.controller,
            textInputAction: widget.inputAction,
            style: TextStyle(
              color: Configuration().colors.primaryBlack,
            ),
            decoration: InputDecoration(
              fillColor: Colors.grey,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Configuration().colors.primaryBlack,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Configuration().colors.primaryColor,
                ),
              ),
            ),
            onChanged: (phone) {
              if (widget.onChange != null) {
                // ignore: prefer_null_aware_method_calls
                widget.onChange!(phone.completeNumber);
              }
            },
            onCountryChanged: (country) {},
          ),
        if (widget.inputType != TextInputType.phone)
          TextFormField(
            controller: widget.controller,
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            inputFormatters: widget.inputFormatters,
            readOnly: widget.isDisabled == true,
            decoration: InputDecoration(
              fillColor: Configuration().colors.primaryGray,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
              suffixIcon: widget.obscureText == true
                  ? InkWell(
                      child: Icon(
                        _obscureText == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 17.5,
                        color: Configuration().colors.primaryBlack,
                      ),
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              border: widget.hasBorder == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Configuration().colors.primaryWhite,
                      ),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Configuration().colors.primaryWhite,
                ),
              ),
            ),
            obscureText: _obscureText == true,
            onChanged: widget.onChange,
            onSaved: widget.onSaved,
            validator: (String? input) {
              if (widget.required) {
                if (input?.isNotEmpty != true) {
                  return '*required';
                }
              }
              if (widget.validator != null) {
                return widget.validator!(input);
              }
              return null;
            },
            style: TextStyle(
              color: Configuration().colors.primaryBlack,
            ),
          ),
      ],
    );
  }
}
