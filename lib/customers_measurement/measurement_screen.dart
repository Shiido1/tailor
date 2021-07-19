import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_view_widget.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({Key key}) : super(key: key);

  @override
  _MeasurementScreenState createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  bool iconBarGender = false;
  bool iconBarClass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:16.0,right:16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              TextViewWidget(
                text: 'Measurement',
                textSize: 25,
                color: AppColor.black,
                fontWeight: FontWeight.w600,),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right:16.0),
                child: Image.asset('assets/measurement.png'),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColor.purple
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextViewWidget(
                              text: 'Gender',
                              fontWeight: FontWeight.w400,
                              textSize: 18,
                              color: AppColor.white,),
                            iconBarGender==false?IconButton(
                              icon: Icon(Icons.add,color: AppColor.white,),
                              onPressed: ()=>setState((){
                                iconBarGender = true;
                              }),):IconButton(
                              icon: Icon(
                                Icons.minimize_outlined,color: AppColor.white,),
                              onPressed: ()=>setState((){
                                iconBarGender = false;
                              }),)

                          ],
                        ),
                      ),
                    ),
                    iconBarGender==false?Container():Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColor.grey,
                            width: 1,
                          ),
                          left: BorderSide(
                            color: AppColor.grey,
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: AppColor.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextViewWidget(
                                    text: 'Male',
                                    textSize: 20,
                                    color: AppColor.black),
                                IconButton(
                                    icon: Icon(Icons.adjust_outlined),
                                    onPressed: (){})
                              ],
                            ),
                          ),
                          Divider(thickness: 1,color: AppColor.grey,),
                          Padding(
                            padding: const EdgeInsets.only(left: 16,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextViewWidget(
                                    text: 'Female',
                                    textSize: 20,

                                    color: AppColor.black),
                                IconButton(
                                    icon: Icon(Icons.adjust_outlined),
                                    onPressed: (){})
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColor.purple
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:10,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextViewWidget(
                              text: 'Class',
                              fontWeight: FontWeight.w400,
                              textSize: 18,
                              color: AppColor.white,),
                            iconBarClass==false?IconButton(
                              icon: Icon(Icons.add,color: AppColor.white,),
                              onPressed: ()=>setState((){
                                iconBarClass = true;
                              }),):IconButton(
                              icon: Icon(
                                Icons.minimize_outlined,color: AppColor.white,),
                              onPressed: ()=>setState((){
                                iconBarClass = false;
                              }),)

                          ],
                        ),
                      ),),
                    iconBarClass==false?Container():displayIconBar(
                      widget1: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextViewWidget(
                              text: 'Adult',
                              textSize: 20,
                              color: AppColor.black),
                          IconButton(
                              icon: Icon(Icons.adjust_outlined),
                              onPressed: (){})
                        ],
                      ),
                      widget2: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextViewWidget(
                              text: 'Teenager',
                              textSize: 20,
                              color: AppColor.black),
                          IconButton(
                              icon: Icon(Icons.adjust_outlined),
                              onPressed: (){})
                        ],
                      ),
                      widget3: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextViewWidget(
                              text: 'Kids',
                              textSize: 20,
                              color: AppColor.black),
                          IconButton(
                              icon: Icon(Icons.adjust_outlined),
                              onPressed: (){})
                        ],
                      ),
                      widget4: Container(),
                      widget5: Container(),
                      widget6: Container(),
                      widget7: Container(),
                      widget8: Container(),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget displayIconBar({
    Widget widget1,
    Widget widget2,
    Widget widget3,
    Widget widget4,
    Widget widget5,
    Widget widget6,
    Widget widget7,
    Widget widget8,})=>Container(
    decoration: BoxDecoration(
      border: Border(
        right: BorderSide(
          color: AppColor.grey,
          width: 1,
        ),
        left: BorderSide(
          color: AppColor.grey,
          width: 1,
        ),
        bottom: BorderSide(
          color: AppColor.grey,
          width: 1,
        ),
      ),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: widget1,
        ),
        Divider(thickness: 1,color: AppColor.grey,),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: widget2,
        ),
        Divider(thickness: 1,color: AppColor.grey,),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: widget3,
        ),
        Divider(thickness: 1,color: AppColor.grey,),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: widget4==null?null:widget4,
        ),
        Divider(thickness: 1,color: AppColor.grey,),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: widget5==null?null:widget5,
        ),
        Divider(thickness: 1,color: AppColor.grey,),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: widget6==null?null:widget6,
        ),
        Divider(thickness: 1,color: AppColor.grey,),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: widget7==null?null:widget7,
        ),
        Divider(thickness: 1,color: AppColor.grey,),
        Padding(
          padding: const EdgeInsets.only(left: 16,right: 10),
          child: widget8==null?null:widget8,
        ),
      ],
    ),
  );
}
