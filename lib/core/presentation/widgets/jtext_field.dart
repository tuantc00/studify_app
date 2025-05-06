import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../resources/palette.dart';
import '../../resources/style.dart';

class JTextField extends StatefulWidget {
  JTextField({
    super.key,
    this.title,
    this.titleTextStyle,
    this.textStyle,
    this.textAlign,
    this.controller,
    this.initialValue,
    this.hintText,
    this.isRequired = false,
    this.autoValidateMode,
    this.keyboardType,
    this.inputType = InputType.none,
    this.jLengthLimit,
    this.maxLines = 1,
    this.inputFormatters,
    this.enable = true,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.disableChangeRequestFocus = false,
    this.borderRadius = 8,
    this.decoration,
    this.textFieldHeight,
    this.hintColor = Palette.text,
    EdgeInsets? contentPadding,
    this.validator,
    this.onEditingComplete,
    this.onTapOutside,
    this.onChanged,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    double? fontSize,
  }) : fontSize = fontSize ?? 13.w,
       hintPadding =
           contentPadding ??
           EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w);

  final String? title;
  final TextStyle? titleTextStyle;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final String? hintText;
  final TextEditingController? controller;
  final String? initialValue;

  final bool isRequired;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final InputType inputType;
  final JLengthLimiting? jLengthLimit;
  final int? maxLines;

  final List<TextInputFormatter>? inputFormatters;
  final bool enable;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool autofocus;
  final bool disableChangeRequestFocus;

  final double borderRadius;
  final InputDecoration? decoration;
  final double? textFieldHeight;
  final Color hintColor;
  final double? fontSize;
  final EdgeInsets hintPadding;

  final TextCapitalization textCapitalization;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final Function(PointerDownEvent value)? onTapOutside;
  final VoidCallback? onEditingComplete;

  @override
  State<JTextField> createState() => _JTextFieldState();
}

class _JTextFieldState extends State<JTextField> {
  final _obscure = ValueNotifier<bool>(true);

  late final FocusNode _focusNode;
  bool canRequestFocus = true;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextInputType? builtKeyboardType;
    List<TextInputFormatter>? builtInputFormatters;

    switch (widget.inputType) {
      case InputType.name:
        builtKeyboardType = widget.keyboardType;
        builtInputFormatters =
            widget.inputFormatters ??
            [
              FilteringTextInputFormatter.deny(RegExp(r'^\s')),
              LengthLimitingTextInputFormatter(widget.jLengthLimit?.maxLength),
            ];
        break;

      case InputType.personName:
        builtKeyboardType = widget.keyboardType ?? TextInputType.name;
        builtInputFormatters =
            widget.inputFormatters ??
            [
              FilteringTextInputFormatter.allow(
                RegExp(r'[\p{L}\s]', unicode: true),
              ),
              FilteringTextInputFormatter.deny(RegExp(r'(^\s)|\s{2}')),
              LengthLimitingTextInputFormatter(
                widget.jLengthLimit?.maxLength ?? 50,
              ),
            ];
        break;

      case InputType.phone:
        builtKeyboardType = widget.keyboardType ?? TextInputType.number;
        builtInputFormatters =
            widget.inputFormatters ??
            [
              FilteringTextInputFormatter.allow(RegExp(r'^0[0-9]*')),
              LengthLimitingTextInputFormatter(10),
            ];
        break;

      case InputType.password:
        builtKeyboardType =
            widget.keyboardType ?? TextInputType.visiblePassword;
        builtInputFormatters =
            widget.inputFormatters ??
            [LengthLimitingTextInputFormatter(widget.jLengthLimit?.maxLength)];
        break;

      case InputType.numberOnly:
        builtKeyboardType = widget.keyboardType ?? TextInputType.number;
        builtInputFormatters =
            widget.inputFormatters ??
            [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(widget.jLengthLimit?.maxLength),
            ];
        break;

      case InputType.numberThousand:
        builtKeyboardType = widget.keyboardType ?? TextInputType.number;
        builtInputFormatters =
            widget.inputFormatters ??
            [
              // ThousandsSeparatorInputFormatter(
              //   maxIntegerPartLength: widget.jLengthLimit?.maxIntegerPartLength ?? 10,
              //   maxDecimalPartLength: 0,
              // ),
              LengthLimitingTextInputFormatter(widget.jLengthLimit?.maxLength),
            ];
        break;

      case InputType.numberThousandDecimal:
        builtKeyboardType =
            widget.keyboardType ??
            const TextInputType.numberWithOptions(decimal: true);
        builtInputFormatters =
            widget.inputFormatters ??
            [
              // ThousandsSeparatorInputFormatter(
              //   maxIntegerPartLength: widget.jLengthLimit?.maxIntegerPartLength ?? 10,
              //   maxDecimalPartLength: widget.jLengthLimit?.maxDecimalPartLength ?? 2,
              // ),
              LengthLimitingTextInputFormatter(widget.jLengthLimit?.maxLength),
            ];
        break;

      case InputType.none:
        builtKeyboardType = widget.keyboardType;
        builtInputFormatters =
            widget.inputFormatters ??
            [LengthLimitingTextInputFormatter(widget.jLengthLimit?.maxLength)];
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.only(bottom: 12.w),
            child: FittedBox(
              child: RichText(
                text: TextSpan(
                  text: widget.title!,
                  style:
                      widget.titleTextStyle ??
                      textTheme.labelLarge?.copyWith(color: Palette.titleText),
                  children: [
                    if (widget.isRequired)
                      TextSpan(
                        text: ' *',
                        style: textTheme.labelLarge?.copyWith(
                          color: Palette.errorText,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        Theme(
          data: themeData.copyWith(disabledColor: Palette.text),
          child: SizedBox(
            height: widget.textFieldHeight,
            child: ValueListenableBuilder(
              valueListenable: _obscure,
              builder: (context, value, _) {
                return TextFormField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  autofocus: widget.autofocus,
                  canRequestFocus: canRequestFocus,
                  initialValue: widget.initialValue,
                  autovalidateMode: widget.autoValidateMode,
                  keyboardType: builtKeyboardType,
                  inputFormatters: builtInputFormatters,
                  enabled: widget.enable,
                  obscureText:
                      widget.inputType == InputType.password
                          ? _obscure.value
                          : false,
                  style:
                      widget.textStyle ??
                      textTheme.bodyMedium?.copyWith(
                        color: Palette.titleText,
                        fontSize: widget.fontSize,
                      ),
                  textAlign: widget.textAlign ?? TextAlign.start,
                  maxLines: widget.maxLines,
                  decoration:
                      widget.decoration?.copyWith(
                        hintStyle: (widget.textStyle ?? textTheme.bodyMedium)
                            ?.copyWith(color: widget.hintColor),
                      ) ??
                      InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.borderTextField,
                            width: 0.5.w,
                          ),
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.titleText,
                            width: 0.5.w,
                          ),
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius,
                          ),
                        ),
                        contentPadding: widget.hintPadding,
                        hintText: widget.hintText,
                        hintStyle: textTheme.bodyMedium?.copyWith(
                          color: widget.hintColor,
                        ),
                        errorMaxLines: 10,
                        prefixIcon:
                            widget.prefixIcon != null
                                ? Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: widget.prefixIcon,
                                )
                                : null,
                        suffixIcon:
                            widget.inputType == InputType.password
                                ? GestureDetector(
                                  onTap: () => _obscure.value = !_obscure.value,
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),
                                    child:
                                        _obscure.value
                                            ? Assets.icons.eyeSlash.svg()
                                            : Assets.icons.eye.svg(),
                                  ),
                                )
                                : widget.suffixIcon,
                      ),
                  textCapitalization: widget.textCapitalization,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  onEditingComplete: () {
                    if (!widget.disableChangeRequestFocus)
                      canRequestFocus = false;
                    widget.onEditingComplete?.call();
                  },
                  onFieldSubmitted: widget.onFieldSubmitted,
                  onTap: () async {
                    if (!widget.disableChangeRequestFocus) {
                      canRequestFocus = true;
                      setState(() {});
                      await Future.delayed(Durations.short1);
                      _focusNode.requestFocus();
                    }
                  },
                  onTapOutside: (event) {
                    if (!widget.disableChangeRequestFocus) {
                      canRequestFocus = false;
                    }
                    if (widget.onTapOutside != null) {
                      widget.onTapOutside!.call(event);
                    } else {
                      _focusNode.unfocus();
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

enum InputType {
  name,
  personName,
  phone,
  password,
  numberOnly,
  numberThousand,
  numberThousandDecimal,
  none,
}

class JLengthLimiting {
  JLengthLimiting({
    this.maxLength,
    this.maxIntegerPartLength,
    this.maxDecimalPartLength,
  });

  final int? maxLength;
  final int? maxIntegerPartLength;
  final int? maxDecimalPartLength;
}
