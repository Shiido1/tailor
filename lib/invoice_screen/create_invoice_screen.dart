import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/purple_backgroud_widget.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key key}) : super(key: key);

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PurpleBackgroundWidget(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextViewWidget(
                      text: 'Create Invoice',
                      color: AppColor.black,
                      textSize: 23,
                      fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 50),
                  EditTextWidget(
                    controller: null,
                    textInputType: TextInputType.text,
                    err: '',
                    label:'Customer Name',
                    color: AppColor.black,),
                  EditTextWidget(
                    controller: null,
                    textInputType: TextInputType.text,
                    err: '',
                    label:'Customer Name',
                    color: AppColor.black,),
                  EditTextWidget(
                    controller: null,
                    textInputType: TextInputType.text,
                    err: '',
                    label:'Customer Name',
                    color: AppColor.black,),
              ]
              ),
            ),
          ]
        ),
      ),
    );
  }
}
