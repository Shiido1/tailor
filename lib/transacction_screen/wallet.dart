import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

class EWalletScreen extends StatefulWidget {
  const EWalletScreen({Key key}) : super(key: key);

  @override
  _EWalletScreenState createState() => _EWalletScreenState();
}

class _EWalletScreenState extends State<EWalletScreen> {

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
            children: [
              SizedBox(height: 45),
              TextViewWidget(
                text: 'E Wallet',
                color: AppColor.black,
                textSize: 23,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.account_circle,size: 70,),
                  SizedBox(width: 15),
                  TextViewWidget(
                    text: 'Princess Davidine',
                    color: AppColor.black,
                    textSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                color: AppColor.purple,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextViewWidget(
                                text: 'N50,000.00',
                                color: AppColor.white,
                                textSize: 27,),
                              TextViewWidget(
                                text: 'Balance',
                                color: AppColor.white,
                                textSize: 18.5,),
                            ],
                          ),
                          Container(
                            color: AppColor.white,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10,5),
                              child: TextViewWidget(
                                  text: 'Active',
                                  textSize: 18,
                                  color: AppColor.black),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 65),
                       Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: TextButton
                                      .styleFrom(
                                    backgroundColor:
                                    AppColor.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:4,bottom:4),
                                    child: TextViewWidget(
                                      text: 'Fund Account',
                                      color: AppColor.purple,
                                      textSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(20),                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: TextButton
                                      .styleFrom(
                                    backgroundColor:
                                    AppColor.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:4,bottom:4),
                                    child: TextViewWidget(
                                      text: 'Send Money',
                                      color: AppColor.purple,
                                      textSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 35,),
              EditTextWidget(
                err: '',
                label: 'Search',
                textInputType: TextInputType.text,
                controller:searchController,),
              SizedBox(height: 10),
              transactionCardContainer(),
            ],
          ),
        )));
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
