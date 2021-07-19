import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_view_widget.dart';

// ignore: must_be_immutable
class EditTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obsecure;
  final bool isPassword;
  final TextInputType textInputType;
  final String hint;
  final String err;
  final Function(String text) textCallBack;
  final Function(String text) submitted;
  final Function(String text) validator;
  final Function(String text) saved;
  final int maxLength;
  final TextStyle style;
  final TextAlign textAlign;
  final bool isValidationError;
  bool isEnabled;
  final bool showFlag;
  final bool showIconPicker;
  final bool showImageIconPicker;
  final bool readOnly;
  final VoidCallback iconPickerCallback;
  final FocusNode focusNode;
  final List<TextInputFormatter> inputFormatters;
  final double fontSize;
  final double hintFontSize;
  final bool togglePassword;
  final VoidCallback togglePasswordCallback;
  final IconData iconData;
  final IconData suffixIcon;
  final VoidCallback onTap;
  Widget imageIcon;
  final Color color;
  final InputDecoration decoration;
  final bool paddedSide;

  EditTextWidget({
    @required this.controller,
    this.label,
    this.obsecure = false,
    this.isPassword = false,
    @required this.textInputType,
    this.hint,
    @required this.err,
    this.textCallBack,
    this.submitted,
    this.style,
    this.textAlign = TextAlign.left,
    this.validator,
    this.onTap,
    this.saved,
    this.maxLength,
    this.focusNode,
    this.showFlag = false,
    this.readOnly = false,
    this.isValidationError = false,
    this.isEnabled = true,
    this.fontSize = 14,
    this.hintFontSize = 14,
    this.inputFormatters,
    this.togglePassword = false,
    this.showIconPicker = false,
    this.showImageIconPicker = false,
    this.iconPickerCallback,
    this.togglePasswordCallback,
    this.iconData,
    this.suffixIcon,
    this.imageIcon,
    this.color,
    this.decoration, this.paddedSide,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: hint != null ? true : false,
          child: TextViewWidget(
            text: hint,
            color: AppColor.textColor,
            textSize: hintFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: paddedSide==true?Padding(
            padding: const EdgeInsets.only(left: 32,right: 32),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    readOnly: readOnly,
                    onChanged: textCallBack,
                    maxLength: maxLength,
                    controller: controller,
                    onTap: onTap,
                    focusNode: focusNode,
                    cursorColor: color==null?AppColor.black:AppColor.white,
                    // ignore: missing_return
                    validator: validator,
                    onSaved: saved,
                    textAlign: textAlign,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600,
                        color: color==null?AppColor.black:AppColor.white),
                    obscureText: obsecure,
                    // enabled: isEnabled,
                    keyboardType: textInputType,
                    inputFormatters: inputFormatters,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: color==null?AppColor.black:AppColor.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: color==null?AppColor.black:AppColor.white),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: color==null?AppColor.black:AppColor.white),
                        ),
                        labelText: label,
                        labelStyle: TextStyle(color: color==null?AppColor.textColor:AppColor.white),
                        errorText: isValidationError?err:null,
                        suffixIcon: Icon(
                          suffixIcon,
                          color: AppColor.black,
                        ),
                        errorStyle: TextStyle(
                          color: AppColor.red,
                        ),
                        hintText: hint,
                        hintStyle: TextStyle(
                            color: AppColor.white,
                            fontSize: fontSize),
                        counterText: ''),
                  ),
                ),
                Visibility(
                    visible: showIconPicker,
                    child: IconButton(
                      color: AppColor.black,
                      icon: Icon(iconData),
                      onPressed: iconPickerCallback,
                    )),
                Visibility(
                  visible: showImageIconPicker,
                  child: showImageIconPicker ? imageIcon : Container(),
                ),
              ],
            ),
          ):Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: TextFormField(
                            readOnly: readOnly,
                            onChanged: textCallBack,
                            maxLength: maxLength,
                            controller: controller,
                            onTap: onTap,
                            focusNode: focusNode,
                            cursorColor: color==null?AppColor.black:AppColor.white,
                            // ignore: missing_return
                            validator: validator,
                            onSaved: saved,
                            textAlign: textAlign,
                            style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.w600,
                                color: color==null?AppColor.black:AppColor.white),
                            obscureText: obsecure,
                            // enabled: isEnabled,
                            keyboardType: textInputType,
                            inputFormatters: inputFormatters,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: color==null?AppColor.black:AppColor.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: color==null?AppColor.black:AppColor.white),
                                ),
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: color==null?AppColor.black:AppColor.white),
                                ),
                                labelText: label,
                                labelStyle: TextStyle(color: color==null?AppColor.textColor:AppColor.white),
                                errorText: isValidationError?err:null,
                                suffixIcon: Icon(
                                  suffixIcon,
                                  color: AppColor.black,
                                ),
                                errorStyle: TextStyle(
                                  color: AppColor.red,
                                ),
                                hintText: hint,
                                hintStyle: TextStyle(
                                    color: AppColor.white,
                                    fontSize: fontSize),
                                counterText: ''),
                          ),
                        ),
                        Visibility(
                            visible: showIconPicker,
                            child: IconButton(
                              color: AppColor.black,
                              icon: Icon(iconData),
                              onPressed: iconPickerCallback,
                            )),
                        Visibility(
                          visible: showImageIconPicker,
                          child: showImageIconPicker ? imageIcon : Container(),
                        ),
                      ],
                    ),),
        ),
        SizedBox(
          height: 10,
        ),
        // Visibility(
        //     visible: isValidationError,
        //     child: Text(
        //       err,
        //       style: TextStyle(color: AppColor.red),
        //     ))
      ],
    );
  }
}

