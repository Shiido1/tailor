import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController nameOfShopController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 25),
          child: Container(
            color: AppColor.white,
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextViewWidget(
                      text: 'Profile',
                      color: AppColor.black,
                      textSize: 23,
                      fontWeight: FontWeight.w500,
                      ),
                    Icon(Icons.account_circle,size: 70,)
                  ],
                ),
                EditTextWidget(
                  label: 'Name of Shop',
                  textInputType: TextInputType.text,
                  controller: nameOfShopController,
                  err: 'rtrtrtr',
                  color: AppColor.black,),
                EditTextWidget(
                  label: 'Name of Shop',
                  textInputType: TextInputType.text,
                  controller: nameOfShopController,
                  err: '',
                  color: AppColor.black,),
                EditTextWidget(
                  label: 'Name of Shop',
                  textInputType: TextInputType.text,
                  controller: nameOfShopController,
                  err: '',
                  color: AppColor.black,),
                EditTextWidget(
                  label: 'Name of Shop',
                  textInputType: TextInputType.text,
                  controller: nameOfShopController,
                  err: '',
                  color: AppColor.black,),
                EditTextWidget(
                  label: 'Name of Shop',
                  textInputType: TextInputType.text,
                  controller: nameOfShopController,
                  err: '',
                  color: AppColor.black,),
                EditTextWidget(
                  label: 'Name of Shop',
                  textInputType: TextInputType.text,
                  controller: nameOfShopController,
                  err: '',
                  color: AppColor.black,),
                EditTextWidget(
                  label: 'Name of Shop',
                  textInputType: TextInputType.text,
                  controller: nameOfShopController,
                  err: '',
                  color: AppColor.black,),
                EditTextWidget(
                  label: 'Name of Shop',
                  textInputType: TextInputType.text,
                  controller: nameOfShopController,
                  err: '',
                  color: AppColor.black,),
                SizedBox(
                  height: 90,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 10,right: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 15),
                    itemBuilder: (_, index) => Image.asset('assets/image_mat.png'),
                    itemCount:8,
                  ),
                ),
                SizedBox(height: 15),
                TextViewWidget(
                  text: 'Next',
                  color: AppColor.black,
                  textSize: 25,
                  fontWeight: FontWeight.w700,),
                SizedBox(height: 15),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
