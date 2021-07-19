import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
                text: 'Transaction History',
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
              SizedBox(height: 25),
              transactionCardContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget transactionCardContainer()=>Container(
    padding: EdgeInsets.fromLTRB(10,10,10,0),
    height: 75,
    width: double.maxFinite,
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextViewWidget(
                        text: 'Tailor',
                        color: AppColor.black,
                        textSize: 18,),
                    TextViewWidget(
                        text: 'xxxxxxxxxxxxxxxxxxx',
                        color: AppColor.black,
                        textSize: 16.5,),
                  ],
                ),
              ),
              TextViewWidget(
                  text: 'N5000',
                  textSize: 18,
                  color: AppColor.black),
            ],
          ),
      ),
    ),
  );
}
