import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizary/utils/colors.dart';
import 'package:sizary/widget/text_field_editing_widget.dart';
import 'package:sizary/widget/text_view_widget.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key key}) : super(key: key);

  @override
  _CustomerProfileState createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {

  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerPhoneNoController = TextEditingController();
  TextEditingController customerEmailController = TextEditingController();
  TextEditingController customerContactAddressController = TextEditingController();
  TextEditingController customerDeliveryDateController = TextEditingController();
  TextEditingController customerNegotiatePriceController = TextEditingController();
  TextEditingController customerDepositController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 25),
          child: Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height:15),
                TextViewWidget(
                  text: 'Profile',
                  color: AppColor.black,
                  textSize: 23,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 20,),
                EditTextWidget(
                    controller: customerNameController,
                    textInputType: TextInputType.text,
                    err: '',
                    label:'Customer Name',
                    color: AppColor.black,),
                EditTextWidget(
                  controller: customerPhoneNoController,
                  textInputType: TextInputType.text,
                  err: '',
                  label:'Phone Number',
                  color: AppColor.black,),
                EditTextWidget(
                  controller: customerEmailController,
                  textInputType: TextInputType.text,
                  err: '',
                  label:'Email',
                  color: AppColor.black,),
                EditTextWidget(
                  controller: customerContactAddressController,
                  textInputType: TextInputType.text,
                  err: '',
                  label:'Contact Address',
                  color: AppColor.black,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 25),
                  child: TextViewWidget(
                    text: 'Delivery Date',
                    color: AppColor.textColor,
                    textSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                EditTextWidget(
                  controller: customerDeliveryDateController,
                  textInputType: TextInputType.number,
                  err: '',
                  label:'DD/MM/YYYY',
                  color: AppColor.black,),
                EditTextWidget(
                  controller: customerNegotiatePriceController,
                  textInputType: TextInputType.number,
                  err: '',
                  label:'Negotiate Price',
                  color: AppColor.black,),
                EditTextWidget(
                  controller: customerDepositController,
                  textInputType: TextInputType. number,
                  err: '',
                  label:'Deposit',
                  color: AppColor.black,),
                SizedBox(height: 25,),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton
                        .styleFrom(
                      backgroundColor:
                      AppColor.purple,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextViewWidget(
                        text: 'Submit',
                        color: AppColor.white,
                        textSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )

              ],
            )
          ),
        ),
      )
    );
  }
}
