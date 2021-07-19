import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

class InvoiceScreen1 extends StatefulWidget {
  const InvoiceScreen1({Key key}) : super(key: key);

  @override
  _InvoiceScreen1State createState() => _InvoiceScreen1State();
}

class _InvoiceScreen1State extends State<InvoiceScreen1> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
              SizedBox(height: 45),
          TextViewWidget(
            text: 'Invoice',
            color: AppColor.black,
            textSize: 23,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 25),
          EditTextWidget(
            err: '',
            label: 'Search',
            textInputType: TextInputType.text,
            controller:searchController,),
          SizedBox(height: 25,),
          Container(
            height: 160,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              color: AppColor.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextViewWidget(
                        text: 'Create New Invoice',
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                        textSize: 22,),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.purple,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15,10),
                        child: TextViewWidget(
                            text: 'Start New',
                            textSize: 18,
                            color: AppColor.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextViewWidget(
                text: 'Latest Activities',
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                textSize: 22),
          ),
          transactionCardContainer(),
          ]
          ),
        ),
      ),
    );
  }
  Widget transactionCardContainer()=>Container(
    padding: EdgeInsets.fromLTRB(10,10,10,0),
    height: 85,
    width: double.maxFinite,
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.account_circle,size: 50,),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextViewWidget(
                    text: 'Tailor',
                    color: AppColor.black,
                    textSize: 18,),
                  SizedBox(height: 10,),
                  TextViewWidget(
                    text: '10 May 2021',
                    color: AppColor.black,
                    textSize: 16.5,),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TextViewWidget(
                      text: 'Paid',
                      textSize: 18,
                      color: AppColor.black),
                  SizedBox(height: 10,),
                  TextViewWidget(
                      text: 'N5000',
                      textSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
